---
type: prd-feature
level: 2
scope: feature          # feature nueva | ajuste de feature existente
status: draft           # draft | validado
epica: [epica-slug]     # gobernado por el PRD Maestro de esta épica
prd_brief_origen: [ruta al prd-brief seleccionado]
prototipo: alta-fi
adr: [ruta al ADR asociado]
created: YYYY-MM-DD
last_modified: YYYY-MM-DD
---

# PRD de Feature — [Nombre]

> **Nivel 2 · Feature.** El PRD-brief seleccionado que maduró a **validado**, acompañado de **ADR** y **prototipo de alta fidelidad**. Gobernado (subrogado) por el PRD Maestro de su épica. Se descompone en Iteration PRDs para los sprints.
> **Ubicación:** `handoff-delivery/epicas/[epica]/features/[feature-slug]/prd-[feature].md`

## Trazabilidad
- **Épica (PRD Maestro):** [link]
- **PRD-brief de origen:** [link] · **Oportunidad OST:** [nodo]

## Descripción de la solución
Qué es la feature, qué problema resuelve, para quién.

## Alcance
User journeys / capacidades incluidas. No-alcance explícito.

## Evidencia de validación
Qué supuestos se validaron y con qué evidencia (link a `contexto/evidencia/`). Prototipo alta-fi: [link].

## Decisiones técnicas (ADR)
Resumen + link al ADR. Decisiones pendientes de tercero → placeholder explícito.

## Criterios de aceptación (nivel feature)
- [ ] Verificable de alto nivel 1
- [ ] Verificable de alto nivel 2

## Iteration PRDs
| # | Iteration PRD | Estado |
|---|---------------|--------|
| 01 | `activas/01-[slug].md` | draft/approved/in_dev/validated |

## Changelog
| Version | Date | Author | Description |
