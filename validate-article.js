// validate-article.js
// USAGreenland.com — Static Article Validator (v1.2)
// Phase #21 — Checklist Automation
// Usage: node validate-article.js path/to/article.html

const fs = require("fs");
const path = require("path");

/* -------------------- CONFIG -------------------- */

const REQUIRED_FIELDS = [
    "PRIMARY_CLASS",
    "ARTICLE_TYPE",
    "MONETIZATION_TIER",
    "EMAIL_ELIGIBLE",
    "HOMEPAGE_ELIGIBLE",
    "ADS_ENABLED",
    "LAST_UPDATED",
    "VERSION",
];

const VALID_PRIMARY_CLASSES = [
    "NEWS",
    "ANALYSIS",
    "GUIDE",
    "COMMERCE",
    "PREMIUM",
];

/* -------------------- HELPERS -------------------- */

function fail(message) {
    console.error(`❌ FAIL: ${message}`);
    process.exit(1);
}

function pass(message) {
    console.log(`✅ PASS: ${message}`);
}

function stripBOM(str) {
    return str.replace(/^\uFEFF/, "");
}

function extractMetadataBlock(html) {
    const comments = html.match(/<!--([\s\S]*?)-->/g);
    if (!comments) return null;

    for (const block of comments) {
        if (block.includes("ARTICLE METADATA")) {
            return block;
        }
    }
    return null;
}

function parseMetadata(block) {
    const lines = block.split(/\r?\n/);
    const data = {};

    for (let line of lines) {
        line = stripBOM(line).trim();

        const match = line.match(/^([A-Z_]+):\s*(.+)$/);
        if (match) {
            data[match[1]] = match[2].trim();
        }
    }

    return data;
}

/* -------------------- MAIN -------------------- */

const filePath = process.argv[2];

if (!filePath) {
    fail("No article file provided. Usage: node validate-article.js article.html");
}

if (!fs.existsSync(filePath)) {
    fail(`File not found: ${filePath}`);
}

let html = fs.readFileSync(filePath, "utf8");
html = stripBOM(html);

/* ---- METADATA BLOCK ---- */

const metadataBlock = extractMetadataBlock(html);
if (!metadataBlock) {
    fail("Required ARTICLE METADATA block not found.");
}

const metadata = parseMetadata(metadataBlock);

/* ---- REQUIRED FIELDS ---- */

for (const field of REQUIRED_FIELDS) {
    if (!metadata[field]) {
        fail(`Missing required metadata field: ${field}`);
    }
}

/* ---- PRIMARY_CLASS ---- */

const primary = metadata.PRIMARY_CLASS;

if (!VALID_PRIMARY_CLASSES.includes(primary)) {
    fail(
        `Invalid PRIMARY_CLASS "${primary}". Valid values: ${VALID_PRIMARY_CLASSES.join(
            ", "
        )}`
    );
}

/* ---- CROSS-FIELD RULES ---- */

// PREMIUM rules
if (primary === "PREMIUM") {
    if (metadata.MONETIZATION_TIER !== "PREMIUM") {
        fail("PREMIUM articles must have MONETIZATION_TIER = PREMIUM");
    }
    if (metadata.ADS_ENABLED !== "false") {
        fail("PREMIUM articles must have ADS_ENABLED = false");
    }
}

// COMMERCE rules
if (primary === "COMMERCE") {
    if (metadata.EMAIL_ELIGIBLE !== "false") {
        fail("COMMERCE articles must have EMAIL_ELIGIBLE = false");
    }
    if (metadata.HOMEPAGE_ELIGIBLE !== "false") {
        fail("COMMERCE articles must have HOMEPAGE_ELIGIBLE = false");
    }
}

pass(`Article "${path.basename(filePath)}" passed all validation checks.`);
process.exit(0);
