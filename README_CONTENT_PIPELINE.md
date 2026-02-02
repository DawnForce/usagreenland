USAGreenland.com — Content Pipeline (Author & Editor Guide)

Status: CANON — Active
Applies to: All articles
Purpose: Ensure every article passes system validation before publish

1. Governing Principle (Read First)

Metadata is law. Layout is decoration.

Every article must be:

Created from the canonical template

Classified once, intentionally

Validated before publish

If an article fails validation, it does not publish.

2. Required Workflow (Non-Optional)
Step 1 — Create the Article

Duplicate ARTICLE_TEMPLATE.html

Rename to desired slug (e.g. article4.html)

Do not delete any locked sections

Step 2 — Fill the Metadata Block (Required)

At the very top of the file, complete:

PRIMARY_CLASS
ARTICLE_TYPE
MONETIZATION_TIER
EMAIL_ELIGIBLE
HOMEPAGE_ELIGIBLE
ADS_ENABLED
LAST_UPDATED
VERSION

PRIMARY_CLASS (choose exactly one)
NEWS | ANALYSIS | GUIDE | COMMERCE | PREMIUM


PRIMARY_CLASS controls ads, paywall, homepage, and email behavior.
It is never inferred. It is never changed later.

3. Metadata Rules (Hard Requirements)
A. Required Fields

All fields must be present and non-empty.

Missing field → ❌ cannot publish

B. PRIMARY_CLASS Rules

Exactly one

Must be a valid value

No combinations

No aliases

Invalid PRIMARY_CLASS → ❌ cannot publish

C. Cross-Field Consistency Rules

These combinations are illegal:

PREMIUM
PRIMARY_CLASS = PREMIUM
→ MONETIZATION_TIER must = PREMIUM
→ ADS_ENABLED must = false

COMMERCE
PRIMARY_CLASS = COMMERCE
→ EMAIL_ELIGIBLE must = false
→ HOMEPAGE_ELIGIBLE must = false


Violations → ❌ cannot publish

4. Writing Rules (Scope Discipline)

Editorial content lives only inside the <article> body

Do not edit automation zones

Do not add logic to layout

Do not remove structural sections

5. Pre-Publish Validation (Required)

Before publishing any article, run:

node validate-article.js article-name.html

Expected Outcomes

✅ PASS → publish allowed

❌ FAIL → fix issues, then re-run

There are no overrides.

6. Legacy Articles

Articles created before Phase #21 are:

Either migrated to the canonical template

Or explicitly treated as legacy (non-publishable)

Legacy articles must pass validation before re-publishing.

7. What This System Guarantees

By following this checklist:

No editorial drift

No automation surprises

No retroactive reclassification

Clean migration to WordPress or headless later

This is a trust-preserving content system, not a blogging workflow.

8. Final Author Declaration (Mental Check)

Before publishing, ask:

“Have I chosen PRIMARY_CLASS intentionally and accepted its consequences?”

If yes → proceed.
If no → stop.

End of Document

This README mirrors the validator exactly.
If the README and validator ever disagree, the validator wins.