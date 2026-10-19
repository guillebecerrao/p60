# CLAUDE.md — Context repo for [PRODUCTO]

> Curated memory of the **[PRODUCTO]** context repo, operated with the **P60** framework.
> Deliberately short (~1 screen). Read it at the start of every session. Depth lives in the linked files.
> Agent behavior rules: `p60/framework.md` → constitution (`p60/_framework/memory/constitution.md`). Available skills: `p60/_framework/skills-index.md`.

## What this repo is

The **product operating system** of [PRODUCTO]: discovery, specs, evidence and decisions. Everything lives in `p60/`, never mixed with code: by default the code is in another repo; if this project also hosts it, the code lives outside `p60/` (e.g. `src/` or `site/`): P60 doesn't govern it and the guardrails don't touch it. The agent builds context in `p60/` and code where it belongs. A code spike before Stage 0 (infrastructure, a first page) is fine: log it in the bitácora and bring what it taught you in later as evidence.

> **Note:** folder names are canonical framework structure (part of the pipeline logic) and are not translated. Content is in English.

## Cycle status (update when closing each sub-process)

| Dimension | Status |
|-----------|--------|
| **Active sub-process** | Stage 0 — Context foundation |
| **Target opportunity (OST)** | — |
| **Current bet / appetite** | — |
| **Last session** | see `p60/bitacora/bitacora-agentica.md` |

## Navigation map

| I need… | I go to… |
|---------|----------|
| Strategy and the OST (single source) | `p60/contexto/estrategia/ost.md` |
| To know what evidence exists | `p60/contexto/evidencia/_index.md` → cards → only then the original |
| The foundation (business, market, team, domain) | `p60/contexto/negocio/` · `p60/contexto/mercado-usuario/` · `p60/contexto/equipo/` · `p60/contexto/dominio/` |
| The current cycle's work | `p60/shape/` · `p60/ideate/` · `p60/validate/` |
| PRDs and development specs | `p60/handoff-delivery/epicas/[epic]/` |
| Post-build experiments | `p60/experimentacion/pipeline.md` |
| What happened in previous sessions | `p60/bitacora/` |

## Where things go (resolver — read BEFORE creating a new file)

| It is… | It goes in… | It does NOT go in… |
|--------|-------------|--------------------|
| Raw material (transcript, export, report) | `p60/contexto/evidencia/_inbox/` → processed by `bibliotecario-evidencia` | straight into a context folder (without a card it isn't searchable) |
| An opportunity or discovery insight | the OST (node) + the EV card backing it | a loose doc in `p60/shape/` |
| A solution idea | `p60/ideate/oportunidades/[opp]/candidatas.md` | the OST (only referenced there) |
| An assumption and its test | `p60/validate/oportunidades/[opp]/[idea]/` (map + PRD-brief) | `p60/handoff-delivery/` (only validated work arrives there) |
| A development spec | `p60/handoff-delivery/epicas/[epic]/features/[feature]/` | `p60/validate/` (that's brief level) |
| Something you don't know where to file | `p60/contexto/evidencia/_inbox/` — resolved when processed | a newly invented folder |

## Local rules

1. **Location = state.** `p60/validate/` free · `activas/` frozen · `cerradas/` and `_historia/` backup (don't read by default).
2. **Cite IDs** (`EV-NNN`, OST nodes, `ADR-NNN`), never paths or copies.
3. **Human judgment checkpoints:** choosing outcome/bet, validating AI synthesis, ship/no-ship.
4. Keep this file short; what grows goes to `p60/bitacora/`.

*Instantiated by `p60 init` on [FECHA]. P60 framework v[VERSION] (see `p60/_framework/VERSION`).*
