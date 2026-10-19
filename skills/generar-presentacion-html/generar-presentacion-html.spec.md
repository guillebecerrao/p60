---
component: generar-presentacion-html
type: skill
version: 2.1
status: active
agent_role: architect
last_sync: 2026-10-19
depends_on: [SKILL-format]
---

# Generar Presentación HTML — Spec

## Propósito
Transformar un artefacto estratégico `.md` (OST, roadmaps, backlog, épicas, release plan, análisis/sizing de oportunidades, u otro indicado) en un HTML ejecutivo, visual y comunicable a stakeholders, respetando design system, versionado (History) y multi-idioma.

## Contrato
- **Input:** un artefacto fuente `.md` + confirmación explícita del usuario + `p60/contexto/design-system/DS-input-v1/` + `p60/presentaciones/_presentaciones-config.md` + `p60/presentaciones/_sync-log.md`.
- **Output:** un archivo HTML autónomo guardado en `p60/presentaciones/` con naming según categoría (referencia / ciclo / cross-ciclo), estilado con el design system, con nav a home y footer de documentos relacionados; en su variante multi-idioma incluye las tres traducciones (ES/EN/PT) embebidas con auto-detección y switcher.
- **Invariantes:**
  - Nunca genera sin confirmación del usuario (Paso 1), aunque el `.md` esté recién editado.
  - Los HTML son artefactos **generados**: nunca se editan a mano; se regeneran desde el `.md`.
  - El "mismo artefacto" se identifica por nombre-base, no por fecha.
  - La config es la fuente de verdad del `estado_idiomas`; History guarda solo la versión inmediatamente anterior.
  - Solo los cambios **transversales** al patrón se registran en el sync-log.

## Criterios de aceptación
- [ ] `SKILL.md` lean con las 4 secciones obligatorias; el detalle procedural profundo vive en `references/`.
- [ ] Progressive disclosure real: `references/process-steps.md` (8 pasos + OST), `references/multi-language.md`, `references/config-and-history.md` no se cargan por defecto.
- [ ] Template de output multi-idioma en `templates/presentacion-multilang.md`.
- [ ] Se preserva la fidelidad completa del skill v1 (ningún contenido substantivo eliminado).
- [ ] Registrado en `skills/_index.md`.

## Decisiones (ADR inline)
- **Migración v1.0 → v2.0 (monolito → progressive disclosure):** el skill v1 era un documento monolítico único (~220 líneas) que mezclaba el contrato accionable con material de consulta pesado (protocolo de 8 pasos, arquitectura multi-idioma, esquema de config, lógica de History y del sync-log). Cargarlo entero saturaba el contexto para el 80% de los casos, que solo necesitan el flujo. Se partió en `SKILL.md` lean (contrato de 4 secciones + overview compacto de los 8 pasos con punteros) más tres references topicales (`process-steps`, `multi-language`, `config-and-history`) y un template. Alternativa considerada: un solo `references/detalle.md`; descartada porque los tres ejes (proceso, i18n, config/versionado) se consultan de forma independiente y separarlos permite cargar solo el relevante.
- **Template incluido:** existe un esqueleto HTML multi-idioma genuinamente reusable (objeto `translations` + switcher + detección + footer), por lo que se materializó en `templates/`; el resto de la visualización es demasiado específico por artefacto para plantillarlo.

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 2.0 | 2026-07-08 | Claude (P60 v2) | Migrado desde skill v1 monolítico (`AI-Framework/skills/generar-presentacion-html.md`) al estándar SKILL.md con progressive disclosure: SKILL.md lean + 3 references + 1 template. Fidelidad preservada. |
| 2.1 | 2026-10-19 | Claude Opus 5.5 (Product-Builder) | Rutas de instancia explícitas `p60/…` (layout único, `p60-cli.spec` 0.2). Sync-log apunta al framework P60 (sin referencias a sistemas personales). |
