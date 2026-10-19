---
name: ideacion-estructurada
description: Genera y preselecciona candidatas de solución para la oportunidad target del OST — ideación divergente, comparación estructurada y preselección con criterio explícito.
version: 1.1
status: active
triggers: ["generar ideas de solución", "ideación", "ideemos soluciones", "candidatas para la oportunidad", "brainstorm de soluciones", "abrir el solution space"]
requires_context: ["p60/contexto/estrategia/ost.md (oportunidad target elegida)", "evidencia vinculada al nodo (fichas EV-NNN)"]
bibliography: "Continuous Discovery Habits — Teresa Torres (2021), caps. 9–10"
last_sync: 2026-10-19
---

# Ideación Estructurada

> Convierte al agente en facilitador de ideación del sub-proceso **Ideate**: del nodo hoja elegido en Shape a un set de candidatas preseleccionadas listas para Validate.

## When to Use

Actívalo cuando Shape cerró con una **oportunidad target** (nodo hoja del OST) y hay que **generar ideas de solución** y **preseleccionar candidatas**.

**NO** lo uses para: elegir la oportunidad (eso es Shape / `ost-facilitator`), ni para validar supuestos de las candidatas (eso es Validate / `assumption-testing`).

## Procedure

1. **Anclar en la oportunidad.** Relee el nodo target y su evidencia (`[EV-NNN]` vía fichas). La ideación responde a *esa* necesidad, en voz del usuario — no al espacio general del producto.
2. **Divergir en serio: ≥8–10 ideas.** Las primeras 3 son las obvias; el valor está después. Técnicas: variar el *quién* (otro segmento resuelve distinto), el *cuándo* (otro momento del journey), el *cómo* (manual/automático, push/pull), analogías de otros dominios. El humano aporta ideas propias **antes** de ver las del agente (evita anclaje).
3. **Filtrar contra el outcome.** Descarta las que no impulsarían el outcome del OST aunque sean atractivas. Registra el porqué de cada descarte (1 línea — es contexto futuro).
4. **Comparar las sobrevivientes** con matriz explícita: impacto esperado en el outcome · evidencia que la respalda (siglas EV) · esfuerzo aparente · riesgo mayor. Compare-and-contrast entre ideas — nunca evaluar una idea aislada (whether-or-not).
5. **Preseleccionar ~3 candidatas** (Torres: testear supuestos de varias ideas en paralelo, no enamorarse de una). La preselección la **decide el humano** con la matriz a la vista — checkpoint de juicio, no delegable.
6. **Registrar** en `p60/ideate/oportunidades/[opp]/candidatas.md` (template `templates/candidatas.md`) con trazabilidad al nodo OST. Las candidatas siembran sus PRD-brief al entrar a Validate.

## Pitfalls

- **Parar en 3 ideas.** Con pocas ideas la "elegida" gana por default, no por mérito. → Diverge hasta que aparezcan ideas no-obvias.
- **Candidata = feature ya decidida disfrazada.** Si la conclusión estaba escrita antes de empezar, no hubo Ideate. → El humano aporta ideas antes de ver las del agente.
- **Evaluar con nota numérica única.** La matriz informa una decisión subjetiva; un score la disfraza de objetiva. → Comparación dimensión por dimensión.
- **Preseleccionar 1.** Una sola candidata convierte Validate en confirmación, no en validación. → ~3, salvo justificación explícita.
- **Ideas sin trazabilidad.** Toda candidata referencia el nodo OST y su evidencia; si no puede, es señal de que responde a otra oportunidad.

## Verification

- [ ] ≥8 ideas generadas antes de filtrar; descartes registrados con motivo.
- [ ] Matriz de comparación con impacto/evidencia/esfuerzo/riesgo por candidata.
- [ ] ~3 candidatas preseleccionadas **por el humano**, con criterio explícito.
- [ ] `candidatas.md` creado con trazabilidad al nodo OST y siglas EV.
- [ ] Ninguna candidata es una solución sin necesidad (test: se puede enunciar en voz del usuario).
