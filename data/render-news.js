/*
  USAGreenland.com — Phase #6
  render-news.js (Presentation Layer ONLY)

  STATUS: TEMPORARY SHIM (LOCKED)

  PURPOSE:
  - Render static article cards into pre-defined DOM regions
  - No analytics logic
  - No canonical intelligence
  - No automation behavior

  IMPORTANT:
  - This file consumes a PRESENTATION-SHAPED feed
  - It does NOT represent the canonical DB schema
  - Future phases will replace this with:
      SQLite → export → view adapter

  DO NOT:
  - Add sector logic
  - Add signal inference
  - Add editorial rules
  - Add AI or automation hooks
*/

import { NEWS_ITEMS } from "./news-data.js";

/* ----------------------------- utilities ----------------------------- */

function escapeHtml(str = "") {
    return String(str)
        .replaceAll("&", "&amp;")
        .replaceAll("<", "&lt;")
        .replaceAll(">", "&gt;")
        .replaceAll('"', "&quot;")
        .replaceAll("'", "&#039;");
}

/* ----------------------------- rendering ----------------------------- */

function cardHtml(item) {
    const hasImg = Boolean(item.img);
    const imgAttr = hasImg
        ? `style="background-image:url('${escapeHtml(item.img)}');"`
        : "";

    const deck = item.deck
        ? `<p class="card__deck">${escapeHtml(item.deck)}</p>`
        : "";

    return `
<a href="${escapeHtml(item.href)}" class="card" aria-label="${escapeHtml(item.title)}">
  <div class="card__media" ${imgAttr}></div>
  <p class="card__kicker">${escapeHtml(item.kicker)}</p>
  <h3 class="card__title">${escapeHtml(item.title)}</h3>
  ${deck}
  <p class="card__meta">${escapeHtml(item.meta)}</p>
</a>
`.trim();
}

function renderInto(el, items) {
    if (!el) return;
    el.innerHTML = items.map(cardHtml).join("\n");
}

/* ------------------------------ runtime ------------------------------ */

function run() {
    if (!Array.isArray(NEWS_ITEMS)) {
        console.warn("NEWS_ITEMS not found or invalid");
        return;
    }

    // Homepage: curated "Latest Updates"
    const homeLatestEl = document.getElementById("homeLatest");
    if (homeLatestEl) {
        const homeItems = NEWS_ITEMS
            .filter(item => item.scope === "home-latest") // render hint only
            .slice(0, 3);

        renderInto(homeLatestEl, homeItems);
    }

    // News page: full listing
    const newsGridEl = document.getElementById("newsGrid");
    if (newsGridEl) {
        const newsItems = NEWS_ITEMS
            .filter(item => item.scope === "news") // render hint only
            .slice(0, 12);

        renderInto(newsGridEl, newsItems);
    }
}

run();
