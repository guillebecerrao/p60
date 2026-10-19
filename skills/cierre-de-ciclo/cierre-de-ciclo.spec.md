---
component: cierre-de-ciclo
type: skill
version: 2.0
status: active
agent_role: architect
last_sync: 2026-07-08
depends_on: [SKILL-format]
---

# Cierre de Ciclo — Spec

## Propósito
Facilitar el cierre de un sub-proceso de P60: destilar aprendizajes de **proceso** en la retro, proponer el archivado de artefactos completados y preservar el contexto del ciclo en la bitácora agéntica.

## Contrato
- **Input:** identificación del sub-proceso a cerrar (`shape` / `ideate` / `validate` / `handoff`) + la sesión de trabajo y los artefactos generados en el ciclo.
- **Output:** entrada(s) de retro en `[sub-proceso]/_retro/retro-[sub-proceso].md` (previa aprobación), lista de movimientos propuestos a `_historia/`, y entrada de cierre en `bitacora/bitacora-agentica.md`.
- **Invariantes:** captura aprendizaje de proceso, nunca de producto; ningún archivo se mueve sin confirmación humana explícita (puerta humana / constitución #2).

## Criterios de aceptación
- [ ] `SKILL.md` lean con las 4 secciones obligatorias; protocolo profundo en `references/`.
- [ ] Progressive disclosure real (la reference no se carga por defecto).
- [ ] Template de la entrada de retro en `templates/retro-entry.md`.
- [ ] Ideate y Validate tratados como sub-procesos separados en toda la documentación.
- [ ] Registrado en `skills/_index.md`.

## Decisiones (ADR inline)
- **Migración v1.0 → v2.0:** el skill v1 era un único documento lineal (proceso de 5 pasos + notas). Se separó en `SKILL.md` accionable (contrato de 4 secciones) + `references/retro-y-archivado.md` (protocolo de retro, reglas de archivado, contrato de bitácora) + `templates/retro-entry.md`. Racional: los pasos son la ejecución; el detalle de rutas, reglas de `git mv` y el contrato de bitácora son material de consulta que saturaba el contexto si se cargaba siempre.
- **Split Ideate/Validate:** el fuente v1 enumeraba tres sub-procesos ("Shape / Ideate & Validate / Handoff to Delivery") con una única retro `retro-ideate-validate.md`. En P60 v2 **Ideate y Validate son sub-procesos separados** (constitución #—, split Ideate/Validate). Se reflejó en toda la enumeración: `shape` / `ideate` / `validate` / `handoff`, con retros independientes `retro-ideate.md` y `retro-validate.md`. No se inventó detalle adicional del modelo (Build / Experimentación se mencionan solo como contexto de la cadena completa).

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 2.0 | 2026-07-08 | Claude (P60 v2) | Migrado desde skill v1.0 al estándar SKILL.md con progressive disclosure; reflejado el split Ideate/Validate en sub-procesos y retros. |
