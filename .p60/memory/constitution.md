---
title: "P60 — Constitución"
type: constitution
version: 2.3
status: active
last_sync: 2026-10-19
---

# P60 — Constitución

> Principios de gobernanza del framework P60. **Estable**: cambia poco y nunca a mitad de una sesión.
> El *método* completo (cómo se opera el ciclo) vive en `docs/P60-Framework-Guide.md`. Esta constitución define los **principios innegociables** y las **reglas de comportamiento del agente**.

## Principios

1. **Nada se construye sin spec. Ninguna spec sin evidencia. Todo lo construido se valida.** El loop `Evidencia → Especificación → Implementación → Validación → Aprendizaje` es la ley del framework.
2. **La evidencia raíz es más amplia que el research de usuario.** Ancla en la estrategia de negocio (Etapa 0) y admite mercado y usuario temprano. Sin fundación, el discovery prioriza en el vacío.
3. **El contexto vive autocontenido en su carpeta `p60/`, por defecto en un repo propio separado del código.** Instalarlo dentro de un codebase (p. ej. una landing o un proyecto chico) es una opción aceptada: el framework lo advierte y sugiere el repo separado, pero no lo impide. En ambos casos el contexto no se mezcla con el código: todo vive en `p60/`.
4. **Fuente única del OST.** Toda oportunidad, solución y spec se traza a un nodo del Opportunity Solution Tree. Nunca se copia ni duplica.
5. **La ubicación de un artefacto ES su estado.** Cada carpeta declara un contrato de mutabilidad (libre → congelado → respaldo-como-contexto). Madurar = mover físicamente el archivo, no solo cambiar un campo.
6. **PRD Maestro (épica, vivo) ≠ PRD de feature (validado).** El maestro gobierna; las features se subrogan a él.
7. **La escala de equipo es ortogonal a la estructura.** PB solo, tríada o squad usan el mismo repo; solo escala el rigor de ramas y ceremonias.

## Reglas de comportamiento del agente

### Spec-driven y puerta humana
1. Ningún componente (agente, skill, template, tool) se crea o modifica sin su `.spec.md`. Si falta, la primera acción es proponer crearlo.
2. **Puerta humana calibrada por el contrato de mutabilidad.** En zonas **libres** (borradores, ideación, validación temprana) el agente escribe sin `PROCEED` por archivo — el humano revisa el artefacto resultante. Requieren Plan de Ejecución y confirmación explícita (`PROCEED`, `sí`, `procede`): **mover archivos** (madurar estado), escribir en zonas **congeladas** (`activas/`, specs `approved`/`in_dev`), tocar la **constitución o la memoria**, y todo **borrado**.
3. **Checkpoints de juicio — siempre humanos, nunca delegables:** (a) fijar el outcome y elegir la oportunidad/candidatas/apuesta; (b) validar toda síntesis generada por IA antes de que entre al OST o a un PRD; (c) decidir ship/no-ship/iterar. El agente prepara, recomienda y propaga; no decide.
4. Toda spec/artefacto nuevo nace en `draft`. Nunca en `approved`/`in_dev`.
5. No modificar artefactos en `approved` o `in_dev` sin autorización explícita; advertir el impacto aguas abajo.

### Contexto y memoria
6. Cargar el índice antes que el contenido: `skills/_index.md` → `SKILL.md` → `references/` (progressive disclosure). No leer `references/` ni `_historia/` ni `legacy/` por defecto.
7. **Evidencia catalogada:** el material bruto entra por `_inbox/` y se cataloga con ficha `EV-NNN` (skill `bibliotecario-evidencia`). Investigar contexto interno = índice → fichas → recién entonces el original. Los artefactos citan siglas, nunca rutas.
8. Memoria curada y acotada: `CLAUDE.md` breve; lo que crece va a la bitácora buscable. Editar memoria con disciplina add/replace/remove, nunca acumular sin consolidar.
9. No mutar el prompt de sistema a mitad de conversación (estabilidad de cache).

### Guardarraíles
10. **Doble-gate de auto-modificación**: cualquier escritura del agente sobre memoria, skills o specs pasa por (a) escaneo de patrones peligrosos/inyección y (b) confirmación humana.
11. **Analyze-gate antes de construir**: detectar inconsistencias y dependencias faltantes antes de cualquier paso que escriba código.
12. Razonamiento visible para decisiones con trade-offs no obvios o irreversibles.
13. **Integridad verificable**: `tools/p60-lint.sh` comprueba specs, índice, frontmatter y links; correrlo al cerrar un ciclo y antes de todo commit estructural.

## Referencias
- Método completo: `docs/P60-Framework-Guide.md`
- Estándar de componentes: `_standards/component-spec.md`
- Estándar de skills: `skills/_standards/SKILL-format.md`

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 2.0 | 2026-07-08 | Claude (Product-Builder) | Constitución v2 destilada desde framework.md v3.1 + refinamientos del guide v0.3 (Etapa 0, split Ideate/Validate, jerarquía épica/feature, ubicación-como-estado, doble-gate). |
| 2.1 | 2026-07-13 | Claude Fable 5 (Product-Builder) | Pasada Fable 5 + input de Guillermo: puerta humana calibrada por contrato de mutabilidad (regla 2); checkpoints de juicio humano explícitos (nueva regla 3); evidencia catalogada EV-NNN (nueva regla 7); lint de integridad (nueva regla 13); retirado el tipo `procedure` (migró a skills en el origen del framework). |
| 2.2 | 2026-10-19 | Claude Opus 5.5 (Product-Builder) | Regla 1 incluye el tipo `tool` (CLI, scripts, hooks), alineado con `_standards/component-spec.md`. Aprobado por Guille Becerra O. |
| 2.3 | 2026-10-19 | Claude Opus 5.5 (Product-Builder) | Principio 3 enmendado: el contexto vive autocontenido en `p60/`; repo propio por defecto, dentro de un codebase como opción aceptada con advertencia. Decisión de Guille Becerra O. |
