<!--
========================================================================================
AEDI - IONITY GLOBAL - CHANGELOG
Author: Johan Wilhelm van Antwerp | Ionity (Pty) Ltd | AEDI | Policy 986 AED
(c) 2018-2026 Antwerp Designs | Ionity (Pty) Ltd - All Rights Reserved - TM2
========================================================================================
-->

# Changelog

## [3.0.0] — 2026-08-31 · Consolidation, cross-repo sync, RAG

### Consolidated
- Collapsed five overlapping trees (`ionity-assets/`, `ionity-assets1/`,
  `ionity-assets-ionity-global-ionity-today/`, `assets/`, `images/`) and the flat
  repository root into one canonical layout at the repository root.
- Hashed every file (sha256). **1,611** redundant paths removed,
  **342** distinct blobs packed byte-exact into
  `_archive/duplicates-2026-08-31.bin` (909 MB) with a full
  restore index. Every blob verified to still have a live canonical copy before removal.
- Redundant trees quarantined in `_to_delete/` (deletion is left to the operator).

### Synced
- Cloned and compared **40** Ionity Global / AntwerpDesignsIonity
  repositories across **131** branches.
- **1,618** blobs that existed only on GitHub were imported into `external/`.
- Captured **11,274** cross-branch file records.

### Added
- `derivatives/avif/` — AVIF at 256/512/1024 for every mark.
- `derivatives/svg/` — true potrace vector traces (`-traced.svg`) plus lossless
  scalable wrappers (`-embedded.svg`) for every raster-only mark.
- WebP extended from 4 sizes to the full 20-step ladder.
- ICO, PWA, square and social scopes extended to all **40** masters
  (was 16); social scope list grown to 20 platform-exact sizes.
- `rag/` — retrieval index: corpus, asset cards, cross-branch map, `llms-full.txt`,
  crawl sitemap and a dependency-free browser search UI.
- `ansi/` — terminal art for all 40 masters at 40/60/80/100/160 columns, plus MOTD,
  wordmark banners, signature block and bash / PowerShell / Python players.
- `scripts/rag_embed.py`, `scripts/rag_query.py`, `scripts/rag_reindex.py`,
  `scripts/sync_github_repos.sh`.
- `_folder.yml` + `README.md` in **336** folders.

### Changed
- `metadata/assets.index.{json,jsonl,csv,yaml}` rebuilt with dimensions, kind, role,
  tags, rights and governance on every record; added `assets.rollup.json`.
- `seo/` regenerated: robots (with explicit LLM-crawler rules), sitemaps, schema.org
  organisation + catalogue, manifest, browserconfig, humans, security, llms.txt.
- `README.md`, `MAP.md`, `CATALOG.html` regenerated from the live index.

## [2.0.0] — 2026-08-30
- First de-duplication pass and folder taxonomy; `_archive/duplicates.bin`.

## [1.0.0] — 2026-08-02
- Initial flat asset collection.
