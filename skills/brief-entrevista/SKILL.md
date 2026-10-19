---
name: brief-entrevista
description: Diseña briefs de entrevista cualitativa que traducen gaps del OST en guías de sesión ejecutables (perfil, estructura y preguntas).
version: 2.1
status: active
triggers: ["crear brief de entrevista", "diseñar guía de entrevista", "preparar entrevistas de discovery", "cerrar gaps del ost", "protocolo de entrevista"]
requires_context: ["p60/contexto/estrategia/ost.md", "snapshots de entrevistas previas si existen"]
bibliography: "Continuous Discovery Habits — Teresa Torres (2021), caps. 5–7"
last_sync: 2026-10-19
---

# Brief de Entrevista

> Convierte al agente en diseñador de sesiones de investigación cualitativa: produce briefs de entrevista estructurados y listos para ejecutar a partir de los gaps del OST.

## When to Use

Actívalo cuando el usuario quiera **iniciar** una ronda de entrevistas para cerrar gaps del OST, **diseñar** una guía para nodos con estado `HIPÓTESIS DE EQUIPO` o `INFERIDO`, **preparar** el protocolo de una sesión antes de reclutar, o **documentar** el enfoque de investigación de un conjunto de nodos relacionados.

**NO** lo uses para: documentar entrevistas ya hechas (usa `interview-snapshot`), ni para diseñar un test no moderado de un supuesto (usa `brief-test-no-moderado`), ni para construir/priorizar el árbol (usa `ost-facilitator`).

## Procedure

1. **Seleccionar nodos.** Lee `p60/contexto/estrategia/ost.md` (sección de gaps). Prioriza `HIPÓTESIS DE EQUIPO` (alta) > `INFERIDO` / evidencia directa débil (media). Agrupa 2–3 nodos solo si comparten momento del journey o perfil de participante. **Confirma el foco con el usuario antes de diseñar nada.**
2. **Definir el perfil de participante.** Criterios de inclusión (vinculados directamente a los nodos — si un criterio no produce evidencia de ningún nodo, elimínalo), exclusión, número (4–6/ciclo) y priorización de sub-perfiles difíciles de reclutar.
3. **Estructurar la sesión (≤30 min).** Apertura (2–3) · Calentamiento (3–5, detecta perfil real vs. reclutado) · un bloque por nodo (6–10 c/u) · Cierre (0–2, seguro comprimible). El nodo de mayor vacío va **primero y con el bloque más largo**.
4. **Redactar preguntas por bloque.** 2–3 principales + sondas. Abrir con pregunta de historia (episodio real), profundizar, y solo al final una hipotética. Cada pregunta debe rastrearse a un nodo; si no, elimínala. Tipos y anti-patrones: ver referencia.
5. **Notas para el facilitador.** No corregir modelos mentales erróneos (son evidencia) · pedir historias específicas vs. opiniones · consentimiento/grabación · variaciones por segmento.
6. **Próximos pasos post-entrevista.** Documentar con `interview-snapshot` dentro de 24h · condición de actualización del OST · condición de cambio de estado de nodo (ej. → `VALIDADO` con n) · condición de creación de sub-nodos.
7. **Producir el brief** en `p60/shape/guia-entrevistas/brief-entrevista_[nodos]_[YYYY-MM-DD].md`.

> Fundamentos, tablas de tipos de pregunta y anti-patrones, reglas de agrupación: **`references/methodology.md`**.
> Formato de salida del brief: **`templates/brief-entrevista.md`**.

## Pitfalls

- **Pregunta cerrada de apertura** ("¿tuviste problemas?") → no genera historia. Reformula: "¿me cuentas la última vez que intentaste X?".
- **La pregunta contiene la hipótesis** ("¿te cuesta hacer X?") → contamina la respuesta. Pregunta por la conducta: "¿qué hiciste cuando quisiste hacer X?".
- **Hipotética demasiado temprano** → sin historia concreta previa la respuesta es poco confiable. Siempre después de un episodio real.
- **>3 preguntas principales por bloque** → sobrecarga. 2 sólidas > 4 superficiales.
- **Corregir el modelo mental del participante** en sesión → destruye la evidencia. Su creencia errónea *es* el hallazgo.
- **Brief que mezcla ramas dispares** → nodos de perfiles muy distintos en un mismo brief. Sepáralos.

## Verification

- [ ] Nodos foco confirmados con el usuario; agrupación válida (mismo momento o perfil).
- [ ] Criterios de inclusión trazables a los nodos; sin criterios sobrantes.
- [ ] Sesión ≤30 min; nodo de mayor vacío primero y con el bloque más largo.
- [ ] Cada pregunta principal rastreable a un nodo; apertura por historia, hipotéticas al final.
- [ ] Notas de facilitación incluyen: no corregir modelos mentales, historias > opiniones, consentimiento.
- [ ] Próximos pasos con condiciones explícitas de actualización de OST y cambio de estado de nodo.
- [ ] Brief guardado con el naming `brief-entrevista_[nodos]_[YYYY-MM-DD].md`.
