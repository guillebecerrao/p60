# Template — P60 Context Repo (en)

> Canonical structure of a product's **context repo**. `p60 init` clones and populates it.
> Self-contained and separate from the code. Full method: `docs/P60-Framework-Guide.md`.
> **Folder names are canonical framework structure** (pipeline logic — referenced by skills and agents) **and are not translated**; file content is localized.

```
[product]-context/
├── CLAUDE.md                       # context repo navigation
├── framework.md                    # pointer to the P60 constitution
│
├── contexto/                       # ── Stage 0: Foundation + living context ──
│   ├── negocio/                    # business model, strategy, short/mid/long-term goals
│   ├── mercado-usuario/            # market context + early users (interviews, early adopters)
│   ├── equipo/                     # org structure, squad, roles, working model
│   ├── dominio/                    # glossary, seed design system, tech stack + ADRs
│   ├── estrategia/                 # ost.md (single source), validated evidence, backlog, roadmaps
│   └── evidencia/                  # evidence system — librarian pattern
│       ├── _inbox/                 # entry point: drop raw material here
│       ├── _index.md               # catalog: one row per card (first stop of every search)
│       ├── fichas/                 # EV-NNN-[slug].md — lightweight surrogates of the originals
│       └── originales/             # originals with no natural home in another context folder
│
├── shape/                          # ── Sub-process 1 ── discovery + prioritization
├── ideate/                         # ── Sub-process 2 ── solution idea generation
├── validate/                       # ── Sub-process 3 ── PRD-brief + low-fi prototype + validation
│
├── handoff-delivery/               # ── Sub-process 4 ──
│   └── epicas/[epic]/
│       ├── prd-maestro.md          # Master PRD (epic, living)
│       └── features/[feature]/
│           ├── prd-[feature].md    # validated feature PRD + ADR + hi-fi prototype
│           ├── activas/            # Iteration PRD in sprint window (frozen)
│           └── cerradas/           # implemented (backup-as-context)
│
├── experimentacion/                # ── Sub-process 6 ── post-build validation (Build = 5, in code)
│   └── pipeline.md
│
├── bitacora/                       # memory: agentic + human (searchable)
├── presentaciones/                 # executive HTML for stakeholders
└── _historia/ · legacy/            # backup (do NOT read by default)
```

> **Evidence system (librarian).** All raw material enters through `_inbox/`; the `bibliotecario-evidencia` skill identifies it, creates its `EV-NNN` card (summary + findings + where everything is), files the original in its destination folder and updates `_index.md`. Researching internal context = read index → cards → only then the original. Artifacts (PRDs, OST) cite the `[EV-NNN]` ID, never paths.
