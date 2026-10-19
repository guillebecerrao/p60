---
component: interview-snapshot
type: skill
version: 2.1
status: active
agent_role: architect
last_sync: 2026-10-19
depends_on: [SKILL-format, ost-facilitator]
---

# Interview Snapshot — Spec

## Propósito
Convertir al agente en documentador experto de entrevistas: a partir de una transcripción bruta produce un interview snapshot de una página en formato Torres (*Continuous Discovery Habits*, Cap. 5), que alimenta directamente el OST.

## Contrato
- **Input:** transcripción bruta de una entrevista (Gemini/Meet u otra) + contexto mínimo del participante (speakers confirmados, Quick Facts disponibles).
- **Output:** un snapshot de una sola página en el formato de `templates/snapshot.md`, guardado en `p60/shape/entrevistas/snapshots/snapshot_[nombre]_[fecha].md`.
- **Invariante:** las oportunidades se expresan en voz del participante y nunca como soluciones; el snapshot se ancla en la historia específica, no en generalizaciones; nunca se fabrican datos ausentes de la transcripción.

## Criterios de aceptación
- [ ] `SKILL.md` lean con las 4 secciones obligatorias (When to Use / Procedure / Pitfalls / Verification); teoría y protocolo detallado en `references/`.
- [ ] Progressive disclosure real (referencias no se cargan por defecto).
- [ ] Template de output en `templates/snapshot.md`.
- [ ] Registrado en `skills/_index.md`.

## Decisiones (ADR inline)
- **Migración v1.0 → v2.0 (monolito → progressive disclosure):** el skill v1 era un documento único (~360 líneas) que mezclaba protocolo accionable, fundamentos teóricos, comportamiento del agente, tablas de anti-patrones y el template de output. Se partió en `SKILL.md` (contrato accionable de 4 secciones) + `references/methodology.md` (fundamentos Torres, protocolo detallado PASO 0–6, comportamiento del agente, anti-patrones) + `templates/snapshot.md` (formato de salida). Racional: el grueso del contenido era material de consulta, no de ejecución; cargarlo siempre saturaba contexto. Se conservó todo el contenido sustantivo, solo relocalizado. Se alineó el naming/estructura con el exemplar `ost-facilitator`.
- **`depends_on: ost-facilitator`:** el snapshot es el input aguas-arriba del OST; la frontera se delimitó en el "When to Use" (este skill documenta; `ost-facilitator` mapea y prioriza).

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 2.0 | 2026-07-08 | Claude (P60 v2) | Migrado desde skill v1.0 (Guillermo Becerra, 2026-03-24) al estándar SKILL.md con progressive disclosure. |
| 2.1 | 2026-10-19 | Claude Opus 5.5 (Product-Builder) | Rutas de instancia explícitas `p60/…` (layout único, `p60-cli.spec` 0.2). |
