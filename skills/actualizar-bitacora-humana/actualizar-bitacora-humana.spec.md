---
component: actualizar-bitacora-humana
type: skill
version: 2.0
status: active
agent_role: architect
last_sync: 2026-07-08
depends_on: [SKILL-format]
---

# Actualizar Bitácora Humana — Spec

## Propósito
Consolidar de forma fiable las notas personales del equipo en la bitácora humana compartida, evitando pérdida de información y duplicados, con revisión humana antes de escribir.

## Contrato
- **Input:** `bitacora/bitacora-humana.md` (estado actual) + notas personales nuevas en `trabajo-individual/*/notas/` posteriores a la última entrada.
- **Output:** entradas nuevas insertadas en orden cronológico en `bitacora/bitacora-humana.md`, con `last_modified` actualizado.
- **Invariante:** nunca escribe sin aprobación del usuario (puerta humana); corta por la fecha de la última entrada para no duplicar; la bitácora es resumen, no volcado.

## Criterios de aceptación
- [ ] `SKILL.md` lean con las 4 secciones obligatorias.
- [ ] Template de salida de entrada en `templates/entrada-bitacora.md`.
- [ ] Paso de aprobación humana explícito antes de escribir.
- [ ] Registrado en `skills/_index.md`.

## Decisiones (ADR inline)
- **Migración v1.0 → v2.0:** el skill v1 ya era lean, así que la reestructuración fue conservadora: se reescribió el cuerpo al contrato de 4 secciones (When to Use / Procedure / Pitfalls / Verification) y se extrajo el formato de entrada a `templates/entrada-bitacora.md`. **Sin `references/`**: no había material de consulta profundo que relocalizar; forzar una referencia habría añadido indirección sin valor. El "formato de notas personales" de v1 se absorbió como detalle inline del Procedure (paso 2), por ser input operativo y no teoría consultable.

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 2.0 | 2026-07-08 | Claude (P60 v2) | Migrado desde skill v1.0 (Guillermo) al estándar SKILL.md: contrato de 4 secciones + template de entrada. Sin references (skill lean). |
