---
component: product-design
type: agent
version: 2.2
status: active
agent_role: architect
last_sync: 2026-10-19
depends_on: [constitution, component-spec, product-builder]
---

# Product-Design — Spec

## Propósito
Perfil experto en diseño de producto: aporta juicio senior en UX research, interaction/UI design, experience mapping y validación cuando el Product-Builder le delega el trabajo de dominio. Traza todo diseño a una oportunidad del OST.

## Contrato
- **Input:** una pregunta o tarea de dominio de diseño (research, user flows, wireframes, prototipos, design system, validación de usabilidad).
- **Output:** propuesta de diseño anclada al usuario y al OST, con artefactos visuales cuando aportan, cobertura de sistema (errores/empty states/accesibilidad) y plan de validación.
- **Invariante:** no orquesta el framework ni improvisa otros dominios; no diseña en el vacío; no escribe/mueve/borra sin Plan de Ejecución aprobado.

## Criterios de aceptación
- [ ] Empieza por el usuario y su contexto antes de proponer diseño.
- [ ] Vincula cada diseño a una oportunidad del OST o a un JTBD.
- [ ] Cubre el sistema completo: happy path, estados de error, empty states y accesibilidad (WCAG).
- [ ] Carga índice antes que contenido (progressive disclosure) y respeta puerta humana + doble-gate.

## Decisiones (ADR inline)
- **Migración v1 (1.0) → v2 (2.0):** se reescribe el system-prompt plano de v1 a la **arquitectura XML-tag** (`role/methodology/domain_knowledge/guardrails/output_format/few_shot`) del exemplar. Alternativa (prosa con secciones `##`) descartada por menor steerabilidad y desalineación con el estándar v2.
- **Persona experta subordinada al apex:** se explicita la delegación desde el Product-Builder, alineado al `role: expert` del registry.
- **Rutas de contexto genéricas:** las rutas `p60/contexto/**` de v1 se abstraen a "context-repo instanciado" al ser este el repo del framework, no un producto.

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 2.0 | 2026-07-08 | Claude (P60 v2) | Spec inicial del agente experto, migrado desde el system-prompt v1.0 a la arquitectura v2. |
| 2.1 | 2026-07-13 | Claude Fable 5 (Product-Builder) | Wrapper nativo `.claude/agents/product-design.md` para descubrimiento y delegación automática de Claude Code (fuente única sigue en `agents/product-design.md`). |
| 2.2 | 2026-10-19 | Claude Opus 5.5 (Product-Builder) | Rutas de instancia explícitas `p60/…` (layout único, `p60-cli.spec` 0.2). |
