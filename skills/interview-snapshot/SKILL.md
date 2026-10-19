---
name: interview-snapshot
description: Sintetiza una entrevista de usuario en un interview snapshot de una página (Torres) a partir de una transcripción bruta, listo para alimentar el OST.
version: 2.1
status: active
triggers: ["documentar entrevista", "interview snapshot", "sintetizar entrevista", "extraer oportunidades de entrevista", "procesar transcripción", "snapshot de usuario"]
requires_context: ["transcripción bruta de la entrevista (Gemini/Meet u otra)", "p60/shape/entrevistas/snapshots/ (destino)"]
bibliography: "Continuous Discovery Habits — Teresa Torres (2021), Capítulo 5"
last_sync: 2026-10-19
---

# Interview Snapshot

> Convierte al agente en documentador experto de entrevistas: toma una transcripción bruta y produce un snapshot de una página en formato Torres que alimenta directamente el OST.

## When to Use

Actívalo cuando el usuario quiera **documentar** una entrevista desde una transcripción bruta, **sintetizar** sus aprendizajes clave, **extraer** oportunidades e insights de una conversación, o **preparar** el input para actualizar el OST.

**NO** lo uses para: mapear oportunidades al árbol o priorizarlas (eso es `ost-facilitator`), ni para diseñar el guion de la entrevista antes de hacerla.

## Procedure

1. **Pre-procesar la transcripción.** Confirma quién es el entrevistador vs participante; filtra muletillas y errores fonéticos; separa mentalmente *historia específica* de *generalización*; nota fragmentos ilegibles.
2. **Reconstruir la historia** cronológicamente: detonante → acciones paso a paso → obstáculos → resultado. Ánclala en la instancia concreta, no en lo que el usuario "siempre hace".
3. **Extraer oportunidades** como necesidades/pains/deseos en voz del participante (1ª persona), nunca soluciones. Ante un pedido de feature, pregunta "¿para qué?" y captura la necesidad. Incluye las que emergen de la fricción.
4. **Extraer insights**: observaciones sorprendentes o contradicciones que aún no son oportunidad pero vale registrar (valor acumulativo).
5. **Completar Quick Facts** con datos de contexto presentes en la transcripción. No inventar; adaptar campos al dominio.
6. **Seleccionar la quote memorable**: frase textual, emocional o distintiva, que "desbloquea" la memoria de la historia.
7. **Producir el snapshot** con `templates/snapshot.md` y guardarlo en `p60/shape/entrevistas/snapshots/snapshot_[nombre-apellido]_[YYYY-MM-DD].md`.

> Fundamentos, protocolo detallado por paso, filtros, comportamiento del agente y tablas de anti-patrones: **`references/methodology.md`**.
> Formato de salida: **`templates/snapshot.md`**.

## Pitfalls

- **Mezclar voz del entrevistador con la del participante** → contamina las oportunidades con hipótesis del equipo.
- **Capturar lo declarado ("haría X") en vez de lo hecho** → el comportamiento pasado es más confiable que la intención.
- **Oportunidad = solución/feature** ("quiere notificaciones") → captura la necesidad subyacente.
- **Oportunidad en lenguaje de empresa/producto** → pierde la perspectiva del usuario; debe poder decirla el participante.
- **Sintetizar tanto que se pierde el detalle** → el snapshot debe recordar la historia, no solo resumirla.
- **Omitir lo que "parece único"** → lo anecdótico de hoy puede ser el patrón de mañana.
- **Fabricar datos ausentes** → deja el campo vacío o marca "no mencionado".

## Verification

- [ ] Snapshot en una página, en el formato de `templates/snapshot.md`.
- [ ] Historia anclada en una instancia específica (detonante → acciones → resultado → fricción).
- [ ] Cada oportunidad en 1ª persona, voz del participante, sin ser solución ni sentimiento sin causa, con su origen en la historia.
- [ ] Quote memorable textual (no paráfrasis).
- [ ] Quick Facts solo con datos presentes en la transcripción.
- [ ] Guardado en `p60/shape/entrevistas/snapshots/snapshot_[nombre]_[fecha].md`.
- [ ] Señaladas las oportunidades que podrían alimentar el OST actual.
