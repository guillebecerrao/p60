# CLAUDE.md — Context repo de [PRODUCTO]

> Memoria curada del context repo de **[PRODUCTO]**, operado con el framework **P60**.
> Acotada a propósito (~1 pantalla). Léela al inicio de cada sesión. Lo profundo vive en los archivos linkeados.
> Reglas de comportamiento: `p60/framework.md` → constitución (`p60/_framework/memory/constitution.md`). Skills disponibles: `p60/_framework/skills-index.md`.

## Qué es este repo

El **sistema operativo de producto** de [PRODUCTO]: discovery, specs, evidencia y decisiones. Separado del código (la implementación vive en su propio repo — ver ADR-001 del framework). El agente construye contexto aquí y el código allá.

## Estado del ciclo (actualizar al cerrar cada sub-proceso)

| Dimensión | Estado |
|-----------|--------|
| **Sub-proceso activo** | Etapa 0 — Fundación de contexto |
| **Oportunidad target (OST)** | — |
| **Apuesta / apetito vigente** | — |
| **Última sesión** | ver `p60/bitacora/bitacora-agentica.md` |

## Mapa de navegación

| Necesito… | Voy a… |
|-----------|--------|
| La estrategia y el OST (fuente única) | `p60/contexto/estrategia/ost.md` |
| Saber qué evidencia existe | `p60/contexto/evidencia/_index.md` → fichas → recién entonces el original |
| La fundación (negocio, mercado, equipo, dominio) | `p60/contexto/negocio/` · `p60/contexto/mercado-usuario/` · `p60/contexto/equipo/` · `p60/contexto/dominio/` |
| El trabajo del ciclo en curso | `p60/shape/` · `p60/ideate/` · `p60/validate/` |
| PRDs y specs de desarrollo | `p60/handoff-delivery/epicas/[epica]/` |
| Experimentos post-build | `p60/experimentacion/pipeline.md` |
| Qué pasó en sesiones anteriores | `p60/bitacora/` |

## Dónde va cada cosa (resolver — leer ANTES de crear un archivo nuevo)

| Es… | Va en… | NO va en… |
|-----|--------|-----------|
| Material bruto (transcripción, export, informe) | `p60/contexto/evidencia/_inbox/` → lo procesa `bibliotecario-evidencia` | directo a una carpeta de contexto (sin ficha no es buscable) |
| Una oportunidad o hallazgo de discovery | el OST (nodo) + ficha EV que lo respalda | un doc suelto en `p60/shape/` |
| Una idea de solución | `p60/ideate/oportunidades/[opp]/candidatas.md` | el OST (ahí solo se referencian) |
| Un supuesto y su test | `p60/validate/oportunidades/[opp]/[idea]/` (mapa + PRD-brief) | `p60/handoff-delivery/` (ahí llega lo ya validado) |
| Una spec de desarrollo | `p60/handoff-delivery/epicas/[epica]/features/[feature]/` | `p60/validate/` (eso es nivel brief) |
| Lo que no sabes dónde va | `p60/contexto/evidencia/_inbox/` y se resuelve al procesarlo | inventar una carpeta nueva |

## Reglas locales

1. **Ubicación = estado.** `p60/validate/` libre · `activas/` congelado · `cerradas/` y `_historia/` respaldo (no leer por defecto).
2. **Citar siglas** (`EV-NNN`, nodos OST, `ADR-NNN`), nunca rutas ni copias.
3. **Checkpoints de juicio humanos:** elegir outcome/apuesta, validar síntesis IA, ship/no-ship.
4. Este archivo se mantiene breve; lo que crece va a `p60/bitacora/`.

*Instanciado por `p60 init` el [FECHA]. Framework P60 v[VERSION] (ver `p60/_framework/VERSION`).*
