---
component: gate-zonas
type: tool
version: 1.2
status: active
agent_role: architect
last_sync: 2026-10-19
depends_on: [constitution]
---

# gate-zonas (hook) — Spec

## Propósito
Hacer ejecutable la puerta humana de la constitución (reglas 2 y 10): cuando el agente intenta escribir en una zona protegida o escribe contenido sospechoso en memoria, skills o specs, la herramienta le pide confirmación al humano en vez de dejarlo pasar en silencio.

## Contrato
- **Registro:** hook `PreToolUse` de Claude Code con matcher `Write|Edit|NotebookEdit`, declarado en `.claude/settings.json`. En el framework vive en `tools/hooks/`; en una instancia, en `p60/_framework/hooks/`.
- **Input:** el JSON del evento por stdin (`tool_input.file_path`, `content`, `new_string`).
- **Output:** en zona libre, exit 0 sin salida (sin fricción). En zona protegida o con patrón sospechoso, JSON con `permissionDecision: "ask"` y la razón.
- **Zonas protegidas (por ruta):** `p60/**/activas/` (congelada), `p60/**/cerradas/` y `p60/**/_historia/` (respaldo), `.p60/memory/` o `p60/_framework/memory/` (constitución), `p60/_framework/` (gestionada por `p60 update`), `p60/legacy/`. Se evalúan sobre la ruta relativa a `$CLAUDE_PROJECT_DIR`, anclada al inicio; fuera del proyecto, sin anclar.
- **Doble-gate (por contenido):** al escribir `CLAUDE.md`, `SKILL.md`, `*.spec.md` o bitácoras, escanea patrones de inyección y de comandos peligrosos.
- **Invariantes:** nunca bloquea (`deny`): escala al humano. Ante input ilegible, no interfiere. Requiere `python3`.

## Criterios de aceptación
- [ ] Escribir en `…/activas/x.md` pide confirmación.
- [ ] Escribir en `p60/_framework/agents/x.md` dentro de una instancia pide confirmación.
- [ ] Escribir en `p60/shape/x.md` pasa sin preguntar.
- [ ] Un `SKILL.md` con "ignore previous instructions" pide confirmación.

## Decisiones (ADR inline)
- **`ask` en vez de `deny`:** la constitución pide confirmación humana, no prohibición. Bloquear forzaría a saltarse el hook.
- **Patrones por subcadena de ruta:** funcionan igual en el framework y en cualquier instancia, sin depender de la raíz.

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 1.0 | 2026-07-13 | Claude Fable 5 (Product-Builder) | Hook creado (pasada Fable 5); spec retroactiva. |
| 1.1 | 2026-10-19 | Claude Opus 5.5 (Product-Builder) | Spec creada al incorporar el tipo `tool`. Protege `p60/_framework/memory/` y marca `p60/_framework/` como zona gestionada. |
| 1.2 | 2026-10-19 | Claude Opus 5.5 (Product-Builder) | Zonas evaluadas sobre la ruta relativa al proyecto y ancladas a `p60/` (o `.p60/`): carpetas homónimas del código (`src/legacy/`, `site/activas/`) ya no escalan. |
