---
component: brief-test-no-moderado
type: skill
version: 2.0
status: active
agent_role: architect
last_sync: 2026-10-19
depends_on: [SKILL-format]
---

# Brief de Test No Moderado — Spec

## Propósito
Convertir al agente en diseñador de tests no moderados: traducir una hipótesis de diseño en un brief de bloques (baseline, tareas, comprensión, usabilidad) configurable en Lyssna/Maze/etc. y listo para reclutar participantes.

## Contrato
- **Input:** feature/pantalla + hipótesis a validar + estímulo (imágenes o prototipo) + segmentos de reclutamiento + nodo OST (si aplica).
- **Output:** un brief en el formato de `templates/brief-test.md`, guardado en la ruta confirmada (`ideate-validate/…`), con umbrales de validación definidos antes del lanzamiento y campos faltantes marcados `[PENDIENTE]`.
- **Invariantes:** B1 baseline siempre presente y en espejo con B3; ≤5 tareas; cada tarea mide una sola cosa; ≥20 participantes por segmento; instrucciones autosuficientes; umbrales escritos antes de ver datos.

## Criterios de aceptación
- [ ] `SKILL.md` lean con las 4 secciones obligatorias; teoría y banco de preguntas en `references/`.
- [ ] Progressive disclosure real (`references/` no se cargan por defecto).
- [ ] Template de output en `templates/brief-test.md`.
- [ ] Especificidades de herramienta aisladas en `references/herramientas.md` (skill agnóstico de herramienta).
- [ ] Registrado en `skills/_index.md`.

## Decisiones (ADR inline)
- **Migración v1.0 → v2.0:** el skill v1 era un documento monolítico (~280 líneas) que mezclaba fundamentos, banco de preguntas, comportamiento del agente y template en un solo archivo cargado siempre. Se partió en `SKILL.md` (procedimiento accionable de 6 pasos + pitfalls + verification), `references/methodology.md` (fundamentos, principios, diseño de bloques, banco de preguntas, tabla de umbrales, comportamiento del agente), `references/herramientas.md` (Lyssna/Maze/first-click/scroll — antes disperso en el cuerpo) y `templates/brief-test.md` (formato de salida, antes embebido como bloque de código). Racional: el estímulo y las tablas exhaustivas son material de consulta, no de ejecución; progressive disclosure evita saturar contexto.
- **Metadata en inglés, contenido en español:** por regla de i18n mixta del repo (v2 ES-first). Se descartaron los campos de frontmatter v1 (`tool_reference`, `modification_count`, `author: P60`) por los del estándar SKILL-format (`triggers`, `requires_context`, `last_sync`).
- **Herramienta como reference y no en frontmatter:** v1 fijaba `tool_reference` en el frontmatter; v2 mantiene el skill agnóstico y delega las especificidades a `references/herramientas.md`, alineado con el objetivo de generalización del harvest original (FL-012).

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 2.0 | 2026-07-08 | Claude (P60 v2) | Migrado desde skill v1.0 (harvest triad-sdpb, 2026-06-16; origen `brief-test-lyssna`, Yerko Pezzopane, 2026-06-03) al estándar SKILL.md con progressive disclosure. |
| 2.0 | 2026-10-19 | Claude Opus 5.5 (Product-Builder) | Sincronía verificada contra la historia previa a la publicación del repo (sin deriva); sin cambios de contenido. |
