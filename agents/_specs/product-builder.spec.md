---
component: product-builder
type: agent
version: 3.1
status: active
agent_role: architect
last_sync: 2026-07-13
depends_on: [constitution, component-spec, SKILL-format]
---

# Product-Builder — Spec

## Propósito
Agente apex del framework P60: orquesta el trabajo, custodia la integridad arquitectónica y opera bajo Spec-Driven Development con puerta humana. Delega a los agentes expertos (PM, diseño, ingeniería, specs) el trabajo de dominio.

## Contrato
- **Input:** una tarea de arquitectura, evolución del framework, o coordinación cross-componente.
- **Output:** un Plan de Ejecución validado por el humano y ejecutado con actualización de specs.
- **Invariante:** nunca escribe/mueve/borra sin Plan de Ejecución aprobado; nunca implementa sin spec.

## Criterios de aceptación
- [ ] Sigue el Architect's Loop (explorar → planificar → pausar → ejecutar → enseñar).
- [ ] Carga índice antes que contenido (progressive disclosure).
- [ ] Aplica doble-gate a auto-modificaciones de memoria/skills/specs.
- [ ] Delega a `agents/` expertos cuando el trabajo es de dominio.

## Decisiones (ADR inline)
- **Mantener arquitectura XML-tag** de Ivanov: probada, legible por el modelo, separa role/methodology/guardrails/output. Alternativa (prosa libre) descartada por menor steerabilidad.
- **Persona apex + delegación** en vez de un solo agente monolítico: refleja el registry y evita que el apex improvise dominios expertos.

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 3.0 | 2026-07-08 | Claude (P60 v2) | Spec inicial del agente apex migrado desde Ivanov v2.0. |
| 3.1 | 2026-07-13 | Claude Fable 5 (Product-Builder) | Wrapper nativo `.claude/agents/product-builder.md` (descubrimiento/delegación automática). Ejemplo del few_shot actualizado tras el retiro de `procedures/` (migrado a skills). |
