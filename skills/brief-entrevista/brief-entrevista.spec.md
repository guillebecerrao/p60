---
component: brief-entrevista
type: skill
version: 2.1
status: active
agent_role: architect
last_sync: 2026-10-19
depends_on: [SKILL-format]
---

# Brief de Entrevista — Spec

## Propósito
Convertir al agente en diseñador de sesiones de investigación cualitativa: traducir los gaps del OST (nodos con baja confianza) en guías de entrevista ejecutables, con perfil de participante, estructura temporal y preguntas por bloque.

## Contrato
- **Input:** OST activo (`p60/contexto/estrategia/ost.md`, sección de gaps) + nodos foco confirmados por el usuario + snapshots de entrevistas previas (si existen).
- **Output:** un brief de entrevista en `p60/shape/guia-entrevistas/brief-entrevista_[nodos]_[YYYY-MM-DD].md`, conforme a `templates/brief-entrevista.md`.
- **Invariante:** cada pregunta principal es trazable a un nodo del OST; sesión ≤30 min; el nodo de mayor vacío de evidencia va primero y con el bloque más largo.

## Criterios de aceptación
- [ ] `SKILL.md` lean con las 4 secciones obligatorias; metodología profunda en `references/`.
- [ ] Progressive disclosure real (referencias no se cargan por defecto).
- [ ] Template de output en `templates/brief-entrevista.md`.
- [ ] Confirmación del usuario sobre los nodos foco antes de diseñar.
- [ ] Registrado en `skills/_index.md`.

## Decisiones (ADR inline)
- **Migración v1.0 → v2.0:** el skill v1.0 era un documento monolítico (~295 líneas) que mezclaba fundamentos metodológicos, protocolo detallado, tablas de tipos de pregunta y anti-patrones, comportamiento del agente y template — todo cargado siempre. Se partió en `SKILL.md` (accionable: contrato de 4 secciones), `references/methodology.md` (fundamentos Torres, protocolo detallado paso a paso, tablas exhaustivas, comportamiento del agente) y `templates/brief-entrevista.md` (formato de salida extraído del bloque final del v1). Racional: el grueso del contenido original era material de consulta, no de ejecución; cargarlo siempre saturaba contexto. Progressive disclosure lo evita. Se preservó todo el contenido sustantivo — se relocalizó, no se borró.

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 2.0 | 2026-07-08 | Claude (P60 v2) | Migrado desde skill v1.0 (Yerko Pezzopane 2026-05-29 / harvest triad-sdpb 2026-06-16) al estándar SKILL.md con progressive disclosure. |
| 2.1 | 2026-10-19 | Claude Opus 5.5 (Product-Builder) | Rutas de instancia explícitas `p60/…` (layout único, `p60-cli.spec` 0.2). |
