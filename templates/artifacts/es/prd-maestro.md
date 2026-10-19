---
type: prd-maestro
level: 2
scope: epica
status: active          # draft | active  (NUNCA se cierra mientras la épica viva)
epica: [epica-slug]
outcome: [nodo del OST / outcome de negocio]
created: YYYY-MM-DD
last_modified: YYYY-MM-DD
---

# PRD Maestro — [Épica]

> **Nivel 2 · Maestro.** Documento estratégico **vivo** de la épica. Se actualiza a medida que sus features mutan o se agregan. Gobierna (subroga) a los PRD de feature de la épica. No es input directo de dev — es "el libro de la épica".
> **Ubicación:** `p60/handoff-delivery/epicas/[epica-slug]/prd-maestro.md`

## Visión de la épica
Qué es esta épica, qué outcome persigue, por qué existe. Trazabilidad al OST.

## Alcance y no-alcance
Qué entra y qué explícitamente no.

## Features bajo la épica (índice vivo)
| Feature | PRD de feature | Estado | Nota |
|---------|----------------|--------|------|
| [feature-slug] | `features/[feature-slug]/prd-[feature].md` | draft/validado/in_dev/validated | |

> Este índice mantiene la **visión global sin repetir**: cada feature vive en su carpeta con su propio PRD; el maestro solo las referencia y coordina la coherencia entre ellas.

## Decisiones estructurales de la épica
Decisiones que aplican a más de una feature (ADRs relevantes, principios de UX/arquitectura compartidos).

## Historial de evolución
Cómo la épica ha mutado (features agregadas, alcance ajustado).

## Changelog
| Version | Date | Author | Description |
