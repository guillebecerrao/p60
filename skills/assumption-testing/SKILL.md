---
name: assumption-testing
description: Mapea los supuestos de una candidata (deseabilidad/usabilidad/viabilidad/factibilidad), los rankea por riesgo × desconocimiento y diseña el test más barato para los más riesgosos.
version: 1.1
status: active
triggers: ["mapear supuestos", "assumption test", "qué supuestos tiene esta idea", "de-riskear la candidata", "diseñar test de supuesto", "validar supuestos"]
requires_context: ["el PRD-brief de la candidata (o candidatas.md de Ideate)", "p60/contexto/estrategia/ost.md"]
bibliography: "Continuous Discovery Habits — Teresa Torres (2021), caps. 11–13"
last_sync: 2026-10-19
---

# Assumption Testing

> Convierte al agente en el de-riskeador del sub-proceso **Validate**: hace visibles los supuestos que la candidata necesita que sean ciertos, y diseña el test más barato para los que más duelen si son falsos.

## When to Use

Actívalo cuando una candidata tiene (o va a tener) su **PRD-brief** y hay que **identificar, priorizar y testear sus supuestos** antes de invertir en ella.

**NO** lo uses para: diseñar en detalle un test no moderado en herramienta (eso es `brief-test-no-moderado`, aguas abajo de este skill), ni entrevistas (eso es `brief-entrevista`).

## Procedure

1. **Enunciar la cadena de valor de la candidata**: "el usuario [hace X] → obtiene [Y] → eso mueve [outcome]". Cada eslabón esconde supuestos.
2. **Mapear supuestos por tipo** (tabla del PRD-brief): **deseabilidad** (¿lo quieren?), **usabilidad** (¿saben/pueden usarlo?), **viabilidad** (¿nos conviene como negocio?), **factibilidad** (¿podemos construirlo?). Incluye los incómodos — el supuesto que nadie quiere enunciar suele ser el letal.
3. **Rankear por riesgo × desconocimiento**: eje 1 — qué tan grave si es falso; eje 2 — cuánta evidencia real tenemos (fichas `EV-NNN`; "lo creemos todos" = desconocimiento alto). Prioriza el cuadrante grave-y-desconocido.
4. **Diseñar el test más barato que dé señal** para los 1–3 supuestos top de **cada candidata** en paralelo (no secuencial): prototipo baja-fi + test no moderado, entrevista dirigida, fake door, smoke test, dato existente que nadie miró. Por test: supuesto → método → **umbral de decisión definido ANTES de correr** ("si <40% completa la tarea, el supuesto es falso").
5. **Ejecutar/derivar**: si el test es no moderado → `brief-test-no-moderado`; si es entrevista → `brief-entrevista`; si es análisis de dato existente → hazlo y ficha el resultado (`bibliotecario-evidencia`).
6. **Actualizar el PRD-brief** con resultados: supuesto confirmado/refutado + evidencia (nueva sigla EV). Cuando los supuestos críticos de una candidata quedan confirmados (o refutados), el **humano decide** `selected`/`discarded` con el criterio de decisión del brief.

## Pitfalls

- **Testear la idea entera** ("¿te gusta?") en vez del supuesto específico. → Un test = un supuesto (o pocos, explícitos).
- **Umbral definido después de ver resultados.** Racionalización garantizada. → Umbral antes de correr, escrito en el brief.
- **Solo supuestos de deseabilidad.** Viabilidad y factibilidad matan productos igual. → Forzar las 4 categorías.
- **Test caro para supuesto barato.** Si un dato existente o 3 entrevistas responden, no armes un experimento. → Escalera de costo: dato existente → entrevista → test no moderado → fake door → prototipo funcional.
- **Confirmación en cadena de un solo brazo.** Validar una sola candidata sesga a confirmarla. → Supuestos top de las ~3 candidatas en paralelo (Torres).

## Verification

- [ ] Supuestos mapeados en las 4 categorías, cada uno con riesgo × desconocimiento.
- [ ] Los 1–3 más riesgosos de cada candidata tienen test diseñado con umbral previo.
- [ ] Cada test referencia su supuesto y su método más barato posible.
- [ ] Resultados de vuelta en el PRD-brief con siglas EV nuevas.
- [ ] La decisión `selected`/`discarded` la tomó el humano contra el criterio del brief.
