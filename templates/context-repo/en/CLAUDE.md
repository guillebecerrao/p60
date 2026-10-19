# CLAUDE.md — Context repo for [PRODUCTO]

> Curated memory of the **[PRODUCTO]** context repo, operated with the **P60** framework.
> Deliberately short (~1 screen). Read it at the start of every session. Depth lives in the linked files.
> Agent behavior rules: `framework.md` → P60 constitution. Available skills: framework index (`skills/_index.md` in the P60 repo).

## What this repo is

The **product operating system** of [PRODUCTO]: discovery, specs, evidence and decisions. Separate from the code (implementation lives in its own repo — see framework ADR-001). The agent builds context here and code there.

> **Note:** folder names are canonical framework structure (part of the pipeline logic) and are not translated. Content is in English.

## Cycle status (update when closing each sub-process)

| Dimension | Status |
|-----------|--------|
| **Active sub-process** | Stage 0 — Context foundation |
| **Target opportunity (OST)** | — |
| **Current bet / appetite** | — |
| **Last session** | see `bitacora/bitacora-agentica.md` |

## Navigation map

| I need… | I go to… |
|---------|----------|
| Strategy and the OST (single source) | `contexto/estrategia/ost.md` |
| To know what evidence exists | `contexto/evidencia/_index.md` → cards → only then the original |
| The foundation (business, market, team, domain) | `contexto/negocio/` · `contexto/mercado-usuario/` · `contexto/equipo/` · `contexto/dominio/` |
| The current cycle's work | `shape/` · `ideate/` · `validate/` |
| PRDs and development specs | `handoff-delivery/epicas/[epic]/` |
| Post-build experiments | `experimentacion/pipeline.md` |
| What happened in previous sessions | `bitacora/` |

## Where things go (resolver — read BEFORE creating a new file)

| It is… | It goes in… | It does NOT go in… |
|--------|-------------|--------------------|
| Raw material (transcript, export, report) | `contexto/evidencia/_inbox/` → processed by `bibliotecario-evidencia` | straight into a context folder (without a card it isn't searchable) |
| An opportunity or discovery insight | the OST (node) + the EV card backing it | a loose doc in `shape/` |
| A solution idea | `ideate/oportunidades/[opp]/candidatas.md` | the OST (only referenced there) |
| An assumption and its test | `validate/oportunidades/[opp]/[idea]/` (map + PRD-brief) | `handoff-delivery/` (only validated work arrives there) |
| A development spec | `handoff-delivery/epicas/[epic]/features/[feature]/` | `validate/` (that's brief level) |
| Something you don't know where to file | `contexto/evidencia/_inbox/` — resolved when processed | a newly invented folder |

## Local rules

1. **Location = state.** `validate/` free · `activas/` frozen · `cerradas/` and `_historia/` backup (don't read by default).
2. **Cite IDs** (`EV-NNN`, OST nodes, `ADR-NNN`), never paths or copies.
3. **Human judgment checkpoints:** choosing outcome/bet, validating AI synthesis, ship/no-ship.
4. Keep this file short; what grows goes to `bitacora/`.

*Instantiated by `p60 init` on [FECHA]. P60 framework v2.*
