---
component: disenar-experimento
type: skill
version: 1.1
status: active
agent_role: architect
last_sync: 2026-10-19
depends_on: [SKILL-format, redactar-prd]
---

# Diseñar Experimento — Spec

## Propósito
Dar protocolo a la primera mitad del sub-proceso **Experimentación** (antes sin skill): diseñar la validación post-build con método adecuado, métrica del outcome y umbral pre-registrado.

## Contrato
- **Input:** feature construida y deployada (Iteration PRD en ventana) + su nodo OST.
- **Output:** `p60/experimentacion/experimentos/EXP-NN-[slug].md` pre-registrado + entrada en `pipeline.md`, estado `running` con fecha de corte.
- **Invariantes:** métrica primaria = outcome del nodo; umbral y ventana antes de exponer usuarios; instrumentación verificada antes del launch; guardarraíles siempre.

## Criterios de aceptación
- [ ] `SKILL.md` lean con las 4 secciones; template `experimento.md` en `templates/`.
- [ ] Tabla de selección de método por tráfico/riesgo.
- [ ] Registrado en `skills/_index.md`.

## Decisiones (ADR inline)
- **Pre-registro como invariante** (no como buena práctica opcional): con agentes generando análisis a demanda, la tentación de racionalizar umbrales post-hoc crece — el pre-registro es el antídoto estructural.
- **Split diseño/decisión en dos skills** (`disenar-experimento` / `decision-ship`): momentos distintos del ciclo, contextos distintos (pre-launch vs. datos en mano) y el segundo es un checkpoint de juicio humano; separarlos evita que la decisión se cuele en el diseño.

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 1.0 | 2026-07-13 | Claude Fable 5 (Product-Builder) | Creación. Cubre el gap H6 (Experimentación sin skill) del análisis de mejoras (pasada Fable 5). |
| 1.1 | 2026-10-19 | Claude Opus 5.5 (Product-Builder) | Rutas de instancia explícitas `p60/…` (layout único, `p60-cli.spec` 0.2). |
