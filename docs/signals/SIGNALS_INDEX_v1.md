# SIGNALS_INDEX_v1

System: USAGreenland.com — Total Access  
Domain: Signals Intelligence  
Version: v1  
Status: LOCKED  
Owner: Editorial / Systems  
Last Updated: 2026-02-04

---

## 1. Purpose

This document defines the canonical signal types used across USAGreenland.com
and records where signals are applied.

Signals are **observational indicators**, not predictions, opinions, or outcomes.

This index prevents taxonomy drift and supports future automation, premium
features, and audits.

---

## 2. Canonical Signal Types (v1)

Only the following signal types are permitted in SIGNALS_V1 blocks.

| Type | Description |
|---|---|
| policy | Regulatory, diplomatic, or governmental posture shifts |
| capital | Investment interest, financing activity, funding posture |
| infrastructure | Physical build-out, planning, or feasibility activity |
| strategic-defense | Defense-adjacent or dual-use strategic positioning |
| trade-logistics | Shipping, supply chain, transit, and trade movement |
| environmental-constraints | Climate, environmental, or permitting limits |

No additional signal types may be introduced without a version bump.

---

## 3. Signal Metadata Schema (v1)

Each signal must include the following fields:

- type
- sector
- scope
- horizon
- direction
- confidence

All values must conform to allowed enums defined in Phase 32.

Signals must be placed in a commented block labeled `SIGNALS_V1`
immediately after the opening `<body>` tag.

---

## 4. Active Signal Coverage (v1)

### 4.1 Business Modules

| Page | Signals |
|---|---|
| /business/market-overview.html | policy, infrastructure |

### 4.2 Sector Pages

| Page | Signals |
|---|---|
| /business/sectors/critical-minerals.html | policy, capital |
| /business/sectors/infrastructure-construction.html | infrastructure, strategic-defense |

Additional sector pages will be annotated incrementally.

---

## 5. Governance Rules

1. Signals are metadata, not presentation.
2. Signals should be conservative; omission is preferred to speculation.
3. Maximum of three (3) signals per page.
4. Changes to signal blocks require intentional commits.
5. New signal types require a new taxonomy version (v2).

---

## 6. Roadmap Notes (Non-Binding)

Future phases may include:
- Automated signal extraction
- Signal-based filtering
- Premium signal dashboards
- Time-series signal evolution

These features must not alter the SIGNALS_V1 schema.

---

End of document.
