---
component: p60-lint
type: tool
version: 1.1
status: active
agent_role: architect
last_sync: 2026-10-19
depends_on: [constitution, component-spec]
---

# p60-lint — Spec

## Propósito
Volver verificable la regla 13 de la constitución: comprobar en segundos que el repo del framework está íntegro (specs, índice, frontmatter, sincronía y referencias) antes de un commit estructural.

## Contrato
- **Uso:** `tools/p60-lint.sh [RAÍZ]` (default: el padre de `tools/`), o `p60 lint`.
- **Checks:** (1) cada skill tiene `SKILL.md`, spec, frontmatter completo y registro en `skills/_index.md`, sin entradas fantasma; (2) cada agente tiene spec y wrapper nativo; (2b) cada tool tiene spec en `tools/_specs/`; (3) sincronía: `last_sync` de cada spec ≥ fecha del último commit de su componente; (4) las rutas de navegación del `CLAUDE.md` existen.
- **Output:** líneas `OK` / `WARN` / `FAIL` y un resumen. Exit 1 si hay algún FAIL; 0 si solo hay OK o WARN.
- **Ámbito:** markdown del repo del framework. No verifica código (ADR-001).

## Criterios de aceptación
- [ ] Quitar una spec de skill, agente o tool produce FAIL.
- [ ] Un componente con commit más nuevo que el `last_sync` de su spec produce WARN de deriva.
- [ ] El repo limpio da 0 FAIL.

## Decisiones (ADR inline)
- **Deriva como WARN, no FAIL:** la fecha de commit es un proxy. Un cambio de historia (por ejemplo, republicar sin historia) mueve fechas sin cambiar contenido; se revisa a mano antes de corregir `last_sync`.
- **Mapa explícito de tools → spec:** el nombre del archivo no siempre coincide con el del componente (`tools/p60` → `p60-cli`).

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 1.0 | 2026-07-13 | Claude Fable 5 (Product-Builder) | Lint creado (pasada Fable 5); spec retroactiva. |
| 1.1 | 2026-10-19 | Claude Opus 5.5 (Product-Builder) | Spec creada al incorporar el tipo `tool`. Nuevo check 2b (tools ↔ spec) y sincronía de tools. |
