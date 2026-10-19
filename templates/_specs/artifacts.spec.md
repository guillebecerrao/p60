---
component: artifacts
type: template
version: 2.0
status: active
agent_role: architect
last_sync: 2026-07-08
depends_on: [constitution]
---

# Templates de artefactos de producto — Spec

## Propósito
Definir los templates canónicos del sistema de documentación de producto de P60 v2, encarnando el modelo de 3 niveles + jerarquía épica/feature + ubicación-como-estado.

## Contrato
El conjunto cubre el lifecycle completo de un doc de producto:

| Template | Nivel | Alcance | Nace en | Ubicación / mutabilidad |
|----------|-------|---------|---------|-------------------------|
| `prd-brief.md` | 1 | candidata | Validate | `validate/…` — libre |
| `prd-maestro.md` | 2·Maestro | épica (vivo) | Handoff | `epicas/[epica]/` — vivo, no se cierra |
| `prd-feature.md` | 2·Feature | feature (validado) | Handoff | `epicas/[epica]/features/[feature]/` |
| `iteration-prd.md` | 3 | sprint | Handoff | `activas/` (congelado) → `cerradas/` (respaldo) |
| `adr.md` | — | decisión | cualquiera | junto al PRD de feature o al framework |

## Criterios de aceptación
- [ ] Cada template lleva frontmatter con `status` alineado al lifecycle de su nivel.
- [ ] La jerarquía épica→feature es explícita (maestro gobierna; feature se subroga).
- [ ] El principio ubicación=estado está anotado en los templates de nivel 3.
- [ ] i18n-ready: viven en `templates/artifacts/es/`; `en/` y `pt/` diferidos.

## Decisiones (ADR inline)
- **Spec de conjunto (no una por template):** los 5 templates comparten un único modelo de doc; una spec de conjunto evita duplicación y mantiene la coherencia del sistema en un solo lugar. Si un template diverge sustancialmente, se le dará su propia spec.
- **`prd-brief` reemplaza a `feature-brief`, `prd-maestro` a `prd-master`, `iteration-prd` a `prd`** del template de referencia (opción B reconciliada): mismo rol, vocabulario v2, + `prd-feature` y `adr` como piezas nuevas del lifecycle.

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 2.0 | 2026-07-08 | Claude (P60 v2) | Templates de artefactos v2 (prd-brief, prd-maestro, prd-feature, iteration-prd, adr) encarnando el modelo de doc del guide v0.3. |
