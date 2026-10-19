---
component: product-management
type: agent
version: 2.2
status: active
agent_role: architect
last_sync: 2026-10-19
depends_on: [constitution, component-spec, product-builder]
---

# Product-Management — Spec

## Propósito
Perfil experto en gestión de producto: aporta juicio senior en discovery, priorización, outcomes y métricas cuando el Product-Builder le delega el trabajo de dominio. Ancla las decisiones en evidencia y en el OST.

## Contrato
- **Input:** una pregunta o tarea de dominio PM (framing de problema, priorización, brief, métrica, discovery, stakeholder management).
- **Output:** recomendación accionable anclada a evidencia y a un nodo del OST, con framing del problema, próximos pasos y métrica de éxito; cuando corresponde, propone la `.spec.md`.
- **Invariante:** no orquesta el framework ni improvisa otros dominios; no prioriza en el vacío; no escribe/mueve/borra sin Plan de Ejecución aprobado.

## Criterios de aceptación
- [ ] Empieza por enmarcar el problema antes de proponer solución.
- [ ] Reorienta a outcomes en vez de outputs y respalda con evidencia.
- [ ] Traza toda oportunidad/solución a un nodo del OST (fuente única, sin duplicar).
- [ ] Carga índice antes que contenido (progressive disclosure) y respeta puerta humana + doble-gate.

## Decisiones (ADR inline)
- **Migración v1 (1.2) → v2 (2.0):** se reescribe el system-prompt plano de v1 a la **arquitectura XML-tag** (`role/methodology/domain_knowledge/guardrails/output_format/few_shot`) del exemplar `product-builder.md`. Alternativa (mantener prosa con secciones `##`) descartada por menor steerabilidad y por desalineación con el estándar v2.
- **Persona experta subordinada al apex:** se explicita que delega la orquestación al Product-Builder, reflejando el `role: expert` del registry y evitando solapamiento con el apex.
- **Rutas de contexto genéricas:** las rutas `p60/contexto/**` hardcodeadas de v1 se abstraen a "context-repo instanciado" porque este repo es la fuente del framework, no un producto concreto.

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 2.0 | 2026-07-08 | Claude (P60 v2) | Spec inicial del agente experto, migrado desde el system-prompt v1.2 a la arquitectura v2. |
| 2.1 | 2026-07-13 | Claude Fable 5 (Product-Builder) | Wrapper nativo `.claude/agents/product-management.md` para descubrimiento y delegación automática de Claude Code (fuente única sigue en `agents/product-management.md`). |
| 2.2 | 2026-10-19 | Claude Opus 5.5 (Product-Builder) | Rutas de instancia explícitas `p60/…` (layout único, `p60-cli.spec` 0.2). |
