---
component: ost-facilitator
type: skill
version: 2.0
status: active
agent_role: architect
last_sync: 2026-07-08
depends_on: [SKILL-format]
---

# OST Facilitator — Spec

## Propósito
Convertir al agente en facilitador experto de sesiones de Opportunity Solution Tree (Torres), cubriendo creación, actualización, revisión, priorización y exploración de soluciones.

## Contrato
- **Input:** intención de sesión (A/B/C/D) + evidencia de discovery + OST existente (si hay).
- **Output:** el artefacto correspondiente al tipo de sesión, y/o el OST actualizado en `contexto/estrategia/ost.md` (fuente única).
- **Invariante:** nunca duplica el OST; siempre trabaja sobre leaf nodes al explorar soluciones.

## Criterios de aceptación
- [ ] `SKILL.md` lean con las 4 secciones obligatorias; teoría en `references/`.
- [ ] Progressive disclosure real (referencias no se cargan por defecto).
- [ ] Template de output en `templates/ost.md`.
- [ ] Registrado en `skills/_index.md`.

## Decisiones (ADR inline)
- **Migración v1.0 → v2.0:** se partió el documento monolítico de 400 líneas en SKILL.md (accionable) + `references/methodology.md` (consulta) + `templates/ost.md`. Racional: el 80% del contenido original era material de consulta, no de ejecución; cargarlo siempre saturaba contexto. Progressive disclosure lo evita.

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 2.0 | 2026-07-08 | Claude (P60 v2) | Migrado desde skill v1.0 (Guillermo, 2026-03-20) al estándar SKILL.md con progressive disclosure. |
