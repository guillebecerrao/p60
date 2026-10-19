---
component: fundacion-etapa-0
type: skill
version: 1.0
status: active
agent_role: architect
last_sync: 2026-07-14
depends_on: [SKILL-format, bibliotecario-evidencia]
---

# Fundación de Contexto (Etapa 0) — Spec

## Propósito
Dar protocolo a la Etapa 0 (antes solo descrita en el guide): la entrevista de fundación que puebla `contexto/` tras `p60 init` — el complemento agent-driven del wizard (el CLI crea la estructura; este skill la llena de evidencia raíz).

## Contrato
- **Input:** context-repo recién instanciado + acceso conversacional al equipo/founder.
- **Output:** `contexto/{negocio,mercado-usuario,equipo,dominio}/` poblados y validados por bloque; material bruto en `_inbox/`; outcomes candidatos propuestos; estado y bitácora actualizados.
- **Invariantes:** cada bloque se valida antes de darse por poblado; el outcome NO se fija (checkpoint de juicio humano en Shape); evidencia previa siempre a `_inbox/`.

## Criterios de aceptación
- [ ] `SKILL.md` lean con las 4 secciones obligatorias.
- [ ] Cubre los 4 bloques de la tabla de Etapa 0 del guide (§2.b).
- [ ] Registrado en `skills/_index.md`.

## Decisiones (ADR inline)
- **Entrevista por bloques con validación incremental** (no un cuestionario único): produce archivos utilizables aunque la sesión se corte; refleja la cadencia de goteo del framework.
- **Outcome propuesto pero no fijado:** fijar el outcome es la primera decisión de juicio del método; hacerlo en el onboarding la escondería dentro de un trámite.

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 1.0 | 2026-07-13 | Claude Fable 5 (Product-Builder) | Creación — pieza agent-driven del onboarding (`p60 init` + este skill = Etapa 0 completa). |
