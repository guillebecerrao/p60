---
component: ideacion-estructurada
type: skill
version: 1.0
status: active
agent_role: architect
last_sync: 2026-07-13
depends_on: [SKILL-format, ost-facilitator]
---

# Ideación Estructurada — Spec

## Propósito
Dar protocolo al sub-proceso **Ideate** (antes sin skill): de la oportunidad target a ~3 candidatas preseleccionadas con criterio explícito y trazabilidad.

## Contrato
- **Input:** nodo hoja del OST elegido en Shape + su evidencia (fichas EV).
- **Output:** `ideate/oportunidades/[opp]/candidatas.md` con ideas, descartes razonados, matriz de comparación y preselección humana.
- **Invariantes:** divergencia real (≥8 ideas) antes de converger; preselección plural (~3) decidida por el humano; toda candidata trazada al nodo y su evidencia.

## Criterios de aceptación
- [ ] `SKILL.md` lean con las 4 secciones; template `candidatas.md` en `templates/`.
- [ ] El protocolo separa divergencia / filtro / comparación / decisión humana.
- [ ] Registrado en `skills/_index.md`.

## Decisiones (ADR inline)
- **≥8 ideas como piso** (no las 3 obvias): fundamento en Torres — comparar un set amplio evita el "whether-or-not" sobre la primera idea; el costo de divergir con un agente es casi nulo, el sesgo de no hacerlo es caro.
- **Preselección humana obligatoria:** es uno de los checkpoints de juicio del método (guide §cadencia); el agente prepara la comparación, no decide la apuesta.

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 1.0 | 2026-07-13 | Claude Fable 5 (Product-Builder) | Creación. Cubre el gap H6 (Ideate sin skill) del análisis de mejoras (pasada Fable 5). |
