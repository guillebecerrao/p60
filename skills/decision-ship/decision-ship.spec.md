---
component: decision-ship
type: skill
version: 1.0
status: active
agent_role: architect
last_sync: 2026-07-13
depends_on: [SKILL-format, disenar-experimento, bibliotecario-evidencia, cierre-de-ciclo]
---

# Decisión Ship / No-Ship / Iterar — Spec

## Propósito
Dar protocolo a la segunda mitad del sub-proceso **Experimentación**: convertir los resultados de un experimento en una decisión humana registrada y propagada — es el paso que cierra el loop `Evidencia → … → Validación → Aprendizaje` del framework.

## Contrato
- **Input:** experimento `EXP-NN` con resultados al corte + artefactos de la feature.
- **Output:** decisión registrada (ship/no-ship/iterar, autor humano, criterio) + repo propagado (Iteration PRD a `cerradas/`, Maestro, OST, ficha EV, bitácora).
- **Invariantes:** la lectura se contrasta solo contra el umbral pre-registrado; la decisión es humana; sin propagación la corrida no está completa.

## Criterios de aceptación
- [ ] `SKILL.md` lean con las 4 secciones (la decisión se registra en el doc del experimento — sin template propio).
- [ ] Las tres opciones (ship/iterar/no-ship) con criterio explícito cada una.
- [ ] Registrado en `skills/_index.md`.

## Decisiones (ADR inline)
- **Decisión humana como invariante:** es uno de los tres checkpoints de juicio del método (junto a elegir oportunidad y validar síntesis) — el punto donde IA potente + juicio débil haría más daño (Cagan: "PM theater").
- **Propagación dentro del skill** (no delegada al cierre de ciclo): el cierre de ciclo es por sub-proceso y puede ocurrir semanas después; el estado del repo debe reflejar la decisión el mismo día que se toma (ubicación = estado).

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 1.0 | 2026-07-13 | Claude Fable 5 (Product-Builder) | Creación. Cubre el gap H6 (Experimentación sin skill de decisión — el cierre del loop) del análisis de mejoras (pasada Fable 5). |
