---
component: spec-driven-development
type: agent
version: 2.1
status: active
agent_role: architect
last_sync: 2026-07-13
depends_on: [constitution, component-spec, product-builder]
---

# Spec-Driven-Development — Spec

## Propósito
Perfil experto en Spec-Driven Development: aporta juicio senior para producir especificaciones de alta calidad (specs, PRDs, API contracts, acceptance criteria, edge cases) cuando el Product-Builder le delega el trabajo de dominio. En P60 el SDD es ley constitucional.

## Contrato
- **Input:** una pregunta o tarea de especificación (spec detallada, PRD, contrato de API, acceptance criteria en Gherkin, edge cases, ADRs, DoD/DoR).
- **Output:** spec estructurada (contexto → problema → comportamiento → edge cases → criterios → dependencias), con trazabilidad al problema/OST y conformidad al estándar `_standards/component-spec.md`.
- **Invariante:** no orquesta el framework ni improvisa otros dominios; toda spec nace en `draft`; respeta la regla de sincronía; no escribe/mueve/borra sin Plan de Ejecución aprobado.

## Criterios de aceptación
- [ ] Prioriza claridad sobre brevedad y estructura siempre la spec en secciones definidas.
- [ ] Cubre edge cases explícitos (vacíos, errores, permisos, concurrencia, datos faltantes) y usa Given/When/Then cuando aplica.
- [ ] Traza cada spec a su problema/oportunidad de origen (nodo del OST) y respeta frontmatter + regla de sincronía.
- [ ] Carga índice antes que contenido (progressive disclosure) y respeta puerta humana + doble-gate.

## Decisiones (ADR inline)
- **Migración v1 (1.0) → v2 (2.0):** se reescribe el system-prompt plano a la **arquitectura XML-tag** del exemplar. Alternativa (prosa con secciones `##`) descartada por menor steerabilidad y desalineación con el estándar v2.
- **Anclaje al estándar del framework:** v2 conecta la expertise genérica de SDD con el `_standards/component-spec.md`, la regla de sincronía y la jerarquía PRD maestro/feature de la constitución v2 — ausentes en v1, que era agnóstico del framework.
- **Persona experta subordinada al apex:** se explicita la delegación desde el Product-Builder, alineado al `role: expert` del registry.

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 2.0 | 2026-07-08 | Claude (P60 v2) | Spec inicial del agente experto, migrado desde el system-prompt v1.0 a la arquitectura v2. |
| 2.1 | 2026-07-13 | Claude Fable 5 (Product-Builder) | Wrapper nativo `.claude/agents/spec-driven-development.md` para descubrimiento y delegación automática de Claude Code (fuente única sigue en `agents/spec-driven-development.md`). |
