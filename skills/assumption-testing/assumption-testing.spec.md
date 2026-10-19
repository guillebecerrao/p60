---
component: assumption-testing
type: skill
version: 1.0
status: active
agent_role: architect
last_sync: 2026-07-13
depends_on: [SKILL-format, brief-test-no-moderado, brief-entrevista, bibliotecario-evidencia]
---

# Assumption Testing — Spec

## Propósito
Dar protocolo al corazón del sub-proceso **Validate**: identificar y priorizar los supuestos de cada candidata y testear los más riesgosos con el método más barato — antes solo existía el diseño del test no moderado, no el mapeo/priorización que lo antecede.

## Contrato
- **Input:** PRD-brief (o candidatas preseleccionadas de Ideate).
- **Output:** mapa de supuestos por candidata (`templates/mapa-supuestos.md`) + tests con umbral previo + resultados de vuelta en el PRD-brief con siglas EV.
- **Invariantes:** 4 categorías de supuesto siempre; umbral de decisión antes de correr el test; candidatas testeadas en paralelo; la decisión selected/discarded es humana.

## Criterios de aceptación
- [ ] `SKILL.md` lean con las 4 secciones; template en `templates/`.
- [ ] Deriva correctamente a `brief-test-no-moderado` / `brief-entrevista` / análisis directo.
- [ ] Registrado en `skills/_index.md`.

## Decisiones (ADR inline)
- **Riesgo × desconocimiento** (no solo riesgo): un supuesto grave con evidencia sólida no se testea de nuevo; uno grave sin evidencia sí. Es la matriz de Torres operacionalizada con las fichas EV como medida de "cuánto sabemos".
- **Umbral pre-registrado:** práctica estándar de experimentación (evita racionalizar); el agente lo exige como campo obligatorio del test.

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 1.0 | 2026-07-13 | Claude Fable 5 (Product-Builder) | Creación. Cubre el gap H6 (Validate sin protocolo de supuestos) del análisis de mejoras (pasada Fable 5). |
