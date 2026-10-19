# P60

> **AI-Native Spec-Driven Product Building.** Framework que lleva el trabajo de un Product Leader —descubrir, priorizar, validar, especificar— a un repo de git operado con agentes de IA.

Este es el **repo del framework** (la fuente): la constitución, los agentes, los skills, los procedimientos y los templates. Un producto concreto instancia un *context repo* con `p60 init`: todo P60 queda en una carpeta `p60/` del proyecto, autocontenida y compartible por git.

## Estructura

```
P60/
├── CLAUDE.md                 # memoria curada de navegación (leer al inicio)
├── .p60/
│   ├── memory/constitution.md   # principios de gobernanza + reglas del agente
│   └── registry/agents.yaml     # registry data-driven de agentes
├── .claude/agents/           # subagentes nativos de Claude Code (descubrimiento + delegación)
├── agents/                   # system prompts (spec-driven, XML-tag) + _specs/
├── skills/                   # protocolos de tarea (progressive disclosure) + _standards/
├── templates/                # template del context-repo + artefactos, i18n {es,en,pt}
├── tools/                    # p60-lint (verificación de integridad del repo)
├── docs/                     # P60-Framework-Guide (.md + .html) + adr/
└── _standards/               # estándar de .spec.md de componentes
```

## Empezar

**Usuario nuevo (10 min):** `docs/arranque-rapido.md` — de cero a primer ciclo, con ejemplos.

```bash
tools/p60 init ../mi-producto   # convierte esa carpeta en context repo (todo queda en mi-producto/p60/)
tools/p60 skills                # qué sabe hacer el agente
```

**Entender el método (30 min):**
1. Lee `docs/P60-Framework-Guide.md` — el método completo.
2. Lee `.p60/memory/constitution.md` — los principios y reglas.
3. Para trabajar: `CLAUDE.md` te da el mapa de navegación.

## Estado

**v2 · post-Fundación Estructural + mejoras Fable 5.** Pipeline de skills completo (Etapa 0 + 6 sub-procesos), agentes y skills nativos de Claude Code, sistema de evidencia EV-NNN, guardarraíles como hooks, `p60 init` operativo **en ES/EN/PT** (`--lang`; carpetas canónicas, contenido localizado), lint de integridad. Templates de artefactos y skills aún ES-first; `p60 init` portable (todo en `p60/`, sin rutas absolutas ni symlinks, sobre carpeta nueva o existente). En curso: `p60 update` e instalador de un comando — ver `tools/_specs/p60-cli.spec.md`. Próximo hito: **test-drive en producto real**.

*Creado por Guille Becerra O — hello@guillebecerrao.cl*
