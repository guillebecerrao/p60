---
name: ost-facilitator
description: Facilita sesiones de Opportunity Solution Tree (crear, actualizar, revisar, priorizar) según Teresa Torres.
version: 2.1
status: active
triggers: ["crear ost", "actualizar ost", "revisar ost", "priorizar oportunidades", "mapear entrevistas al árbol", "opportunity solution tree"]
requires_context: ["p60/contexto/estrategia/ost.md", "evidencia de discovery disponible"]
bibliography: "Continuous Discovery Habits — Teresa Torres (2021)"
last_sync: 2026-10-19
---

# OST Facilitator

> Convierte al agente en un facilitador experto de sesiones de Opportunity Solution Tree, fundamentado en Teresa Torres.

## When to Use

Actívalo cuando el usuario quiera **crear** un OST desde cero, **actualizar**lo con nuevos hallazgos, **revisar** su calidad, **priorizar** oportunidades, **mapear** entrevistas/insights al árbol, o **preparar** una sesión de discovery.

**NO** lo uses para: escribir specs de solución (eso es Handoff), ni para diseñar el test de un supuesto en detalle (usa `brief-test-no-moderado`).

## Procedure

1. **Clasificar la sesión.** Pregunta "¿qué quieres lograr?" → tipo A (docs→OST), B (revisión de calidad), C (priorización), D (solution space). Pide los documentos si no los proveyó.
2. **Clarificar el Outcome.** Verifica que sea un cambio de comportamiento medible, no un output. Formato: *"[comportamiento] de [baseline] a [target] en [timeframe] para [audiencia]"*.
3. **Estructurar branches** = momentos distintos y **mutuamente excluyentes** del customer journey.
4. **Mapear oportunidades** desde evidencia con el filtro de inclusión (necesidad del usuario ≠ solución · aparece en ≥1 fuente fuerte · impulsaría el outcome). Enmarcar en voz del usuario.
5. **Dar estructura** padre-hijo (inclusión) vs hermanas (distinción). Test hermanas: "¿puedo resolver A sin B?".
6. **Asignar confianza** (ALTA/MEDIA-ALTA/MEDIA/BAJA) con fuentes y quotes.
7. **Priorizar top-down** por ramas (compare-and-contrast, nunca whether-or-not) hasta un **leaf node** = oportunidad target.
8. **Generar ≥3 soluciones** y **identificar el supuesto más riesgoso** por solución + su test más ligero.

> Teoría completa, tablas de anti-patrones y outputs por tipo de sesión: **`references/methodology.md`**.
> Formato de salida del árbol: **`templates/ost.md`**.

## Pitfalls

- **Oportunidad = solución disfrazada** ("quiero push"). → Pregunta "¿para qué?", captura la necesidad.
- **Oportunidad = sentimiento** ("me frustra"). → Busca la causa.
- **Branches que se solapan** → una oportunidad cabe en dos. Sé más específico.
- **Oportunidades verticales** (padre con un solo hijo) → busca hermanas faltantes.
- **Priorización como fórmula matemática** → es decisión subjetiva informada por evidencia, no un score.
- Trabajar en oportunidades padre con hijos sin explorar → siempre elegir leaf nodes.

## Verification

- [ ] Outcome = comportamiento medible (no output).
- [ ] Branches mutuamente excluyentes; cada oportunidad con ≥2 hermanas; sin verticales.
- [ ] Cada oportunidad en voz del usuario, con evidencia y nivel de confianza.
- [ ] Oportunidad target = leaf node, elegida por compare-and-contrast.
- [ ] ≥3 soluciones candidatas; supuesto más riesgoso + test por cada una.
- [ ] OST actualizado en `p60/contexto/estrategia/ost.md` (fuente única — nunca duplicar).
