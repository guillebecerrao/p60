# CLAUDE.md — Repo del framework P60

> Memoria curada del **repositorio del framework P60** (no un context repo de producto).
> Acotada a propósito (~1 pantalla). Léela al inicio de cada sesión. Lo profundo vive en los archivos linkeados, no aquí.

## Qué es este repo

Es la **fuente del framework P60** (descriptor técnico: *End-to-End Spec-Driven Product Building*): la constitución, los agentes, los skills, los procedimientos y los templates que un producto instancia con `p60 init`. **No** es el context repo de un producto concreto — es de dónde salen.

## Mapa de navegación

| Necesito… | Voy a… |
|-----------|--------|
| El método completo (sub-procesos, doc system, workflow) | `docs/P60-Framework-Guide.md` |
| Onboarding, capacitación o demo (con ejemplos explícitos) | `docs/arranque-rapido.md` |
| Instanciar un producto / comandos del CLI | `tools/p60` (`init`, `skills`, `agents`, `lint`, `doctor`) |
| Los principios de gobernanza y las reglas de comportamiento | `.p60/memory/constitution.md` |
| Activar un perfil experto | `.claude/agents/` (nativo — descubrimiento/delegación automática); prompts canónicos en `agents/`, registry en `.p60/registry/agents.yaml` |
| Ejecutar una tarea concreta | `skills/_index.md` → el `SKILL.md` que corresponda |
| El template de un context-repo o de un artefacto | `templates/` |
| Verificar la integridad del repo | `tools/p60-lint.sh` |
| Decisiones estructurales del framework | `docs/adr/` |
| El estándar de un componente (`.spec.md`) | `_standards/component-spec.md` |
| El estándar de un skill (`SKILL.md`) | `skills/_standards/SKILL-format.md` |

## Reglas de comportamiento (resumen — detalle en la constitución)

1. **Spec-driven.** Ningún componente se crea o modifica sin su `.spec.md`. Si no existe, la primera acción es proponerlo.
2. **Puerta humana calibrada por contrato de mutabilidad.** Zonas libres: escribir sin `PROCEED` (el humano revisa el artefacto). Mover/madurar archivos, zonas congeladas, constitución/memoria y borrados: Plan de Ejecución + confirmación explícita.
3. **Checkpoints de juicio humanos.** Elegir outcome/oportunidad/apuesta, validar síntesis IA antes de que entre a OST/PRD, y ship/no-ship — el agente prepara y recomienda; no decide.
4. **Progressive disclosure.** Cargar `skills/_index.md` primero; abrir el `SKILL.md` completo solo del skill relevante; abrir `references/` solo si la tarea lo pide.
5. **Evidencia catalogada.** Material bruto → `_inbox/` → ficha `EV-NNN` (`bibliotecario-evidencia`). Investigar = índice → fichas → original. Citar siglas, nunca rutas.
6. **Memoria acotada.** Este archivo se mantiene curado y breve. Lo que crece va a la bitácora buscable, no aquí (add/replace/remove, nunca acumular).
7. **i18n.** El **context-repo se instancia en ES/EN/PT** (`p60 init --lang`): contenido localizado, **nombres de carpetas canónicos** (lógica del pipeline, no se traducen). Los templates de artefactos y skills siguen ES-first (se traducen en distribución).
8. **Idioma mixto.** Metadata/headers en inglés; contenido en español; anglicismos técnicos del dominio tal cual (discovery, delivery, squad, spec).

*Última actualización: 2026-07-13 — mejoras pasada Fable 5 (agentes nativos, sistema de evidencia, cadencia, cobertura de skills, p60-lint).*
