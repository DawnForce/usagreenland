/*
  USAGreenland.com — Phase #6
  news-data.js (TEMPORARY PRESENTATION FEED)

  STATUS: NON-CANONICAL (LOCKED)

  PURPOSE:
  - Provide a static, presentation-shaped data feed
  - Used ONLY by render-news.js
  - Powers homepage "Latest Updates" and News grid

  IMPORTANT:
  - This file is NOT the canonical article store
  - No sectors, signals, confidence, or analytics belong here
  - This file will be replaced by a DB export in a later phase

  DO NOT:
  - Add intelligence logic
  - Add automation fields
  - Add editorial rules
  - Treat IDs here as permanent
*/

export const NEWS_ITEMS = [

    /* ======================
       NEWS PAGE — Full Listing
       scope: "news"
       ====================== */

    {
        id: "news-001",
        scope: "news", // render hint only
        kicker: "Negotiations",
        title: "Trump's Framework Deal: What It Means",
        deck: "Explore the latest on the U.S. push for access amid NATO talks.",
        meta: "Jan 24, 2026 • 5 min read",
        href: "article1.html",
        img: "assets/news-1z.jpg"
    },

    {
        id: "news-002",
        scope: "news", // render hint only
        kicker: "Diplomacy",
        title: "Greenland's Response to U.S. Proposals",
        deck: "Local views and diplomatic pushback—key signals to watch.",
        meta: "Jan 24, 2026 • 4 min read",
        href: "article2.html",
        img: "assets/news-2c.jpg"
    },

    {
        id: "news-003",
        scope: "news", // render hint only
        kicker: "Resources",
        title: "Mineral Resources in the Spotlight",
        deck: "Breaking down rare earth opportunities and constraints.",
        meta: "Jan 24, 2026 • 6 min read",
        href: "article3.html",
        img: "assets/news-3.jpg"
    },

    /* ======================
       HOMEPAGE — Latest Updates (Curated)
       scope: "home-latest"
       ====================== */

    {
        id: "home-001",
        scope: "home-latest", // render hint only
        kicker: "Deal Tracker",
        title: "Key developments and timeline updates",
        deck: "",
        meta: "Updated daily • 3 min read",
        href: "deal-tracker.html",
        img: "assets/news-1.jpg"
    },

    {
        id: "home-002",
        scope: "home-latest", // render hint only
        kicker: "Explainer",
        title: "What changes if U.S.–Greenland relationship formalizes?",
        deck: "",
        meta: "Evergreen • 6 min read",
        href: "explainer.html",
        img: "assets/news-2.jpg"
    },

    {
        id: "home-003",
        scope: "home-latest", // render hint only
        kicker: "Travel",
        title: "Getting to Greenland: routes, seasons, costs",
        deck: "",
        meta: "Guide • 5 min read",
        href: "travel.html",
        img: "assets/news-3.jpg"
    }

];
