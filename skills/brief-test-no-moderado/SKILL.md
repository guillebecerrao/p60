---
name: brief-test-no-moderado
description: Diseña el brief de un test no moderado (levantar contexto, estructurar bloques, definir umbrales) listo para cargar en Lyssna/Maze y reclutar.
version: 2.0
status: active
triggers: ["diseñar test no moderado", "brief de test", "guía de test lyssna", "estructurar preguntas de test", "test de comprensión", "test de usabilidad no moderado"]
requires_context: ["diseño/prototipo o export de pantallas a testear", "hipótesis a validar", "nodo OST vinculado (si aplica)"]
bibliography: "Lyssna, Maze, UserTesting — práctica de unmoderated testing"
last_sync: 2026-07-08
---

# Brief de Test No Moderado

> Convierte al agente en diseñador de tests no moderados: traduce una hipótesis de diseño en bloques de tareas y preguntas configurables, listos para cargar en la herramienta y reclutar participantes.

## When to Use

Actívalo cuando el usuario quiera **diseñar** un test no moderado para validar comprensión o usabilidad de un diseño, **estructurar** sus preguntas antes de configurarlo, **documentar** el protocolo de un test en preparación, o **reutilizar** la metodología en una nueva feature.

**NO** lo uses para: tests moderados (entrevistas con facilitador), ni para priorizar oportunidades o elegir qué testear (eso es `ost-facilitator`).

## Procedure

1. **Levantar contexto** (Paso 0). Pregunta en orden — no vuelques todo de golpe: feature/pantalla · hipótesis a validar · nodo(s) OST vinculados · estado del diseño. Si la hipótesis es vaga, ayuda a precisarla antes de avanzar.
2. **Definir el estímulo** (Paso 1). (a) imágenes estáticas o (b) prototipo interactivo. Pide link(s) de preview (uno por segmento) y pantallas/flujo. Ver diferencias en **`references/methodology.md`**.
3. **Definir segmentos y reclutamiento** (Paso 2). Nombre, perfil, versión de diseño que ve, N por segmento (**mínimo 20** para datos cuantitativos). Panel de la herramienta vs base de datos propia.
4. **Diseñar los bloques** (Paso 3): B0 segmentación · **B1 baseline pre-task** · B2 tareas sobre el estímulo · **B3 comprensión post-task en espejo del B1** · B4 usabilidad/expectativas. Banco de preguntas y diseño de cada bloque: **`references/methodology.md`**.
5. **Definir umbrales de análisis** (Paso 4) **antes de ver resultados**. Propón los estándar y pide confirmación. Tabla completa: **`references/methodology.md`**.
6. **Checklist pre-lanzamiento** (Paso 5) — genera automáticamente, incluye piloto interno.
7. **Producir y guardar** (Paso 6) con el formato de **`templates/brief-test.md`**. Confirma la ruta antes de escribir; marca campos faltantes como `[PENDIENTE]`.

> Especificidades de herramienta (Lyssna, Maze, first-click, scroll depth): **`references/herramientas.md`**.

## Pitfalls

- **Instrucciones que asumen un facilitador.** Nadie aclara dudas → deben ser autosuficientes.
- **Sin baseline pre-task.** Sin B1 no hay delta que medir. Siempre pre-task antes del estímulo.
- **Post-task que no espeja al pre-task.** B3 debe usar las mismas preguntas que B1, o el delta es inválido.
- **Mezclar objetivos en una tarea** ("¿qué entiendes?" + "¿dónde harías click?"). Cada tarea mide una sola cosa.
- **Más de 5 tareas.** Degrada la calidad → propón dividir en dos tests y explica por qué.
- **Umbrales definidos después de ver los datos.** Escríbelos en el brief antes de lanzar.
- **Preguntas de comprensión sin trampas** o con retroalimentación activa → siempre ≥1 opción incorrecta plausible y feedback desactivado; incluir "Sigo sin saberlo".

## Verification

- [ ] Un brief = un objetivo de validación claro.
- [ ] B1 baseline presente y en espejo con B3.
- [ ] ≤5 tareas; cada tarea mide una sola cosa; instrucciones autosuficientes.
- [ ] ≥20 participantes por segmento; criterios de reclutamiento documentados en B0.
- [ ] Preguntas de comprensión con trampas + "Sigo sin saberlo" y sin retroalimentación.
- [ ] Umbrales de validación escritos antes de lanzar.
- [ ] Checklist pre-lanzamiento incluido (con piloto interno 1–2 personas).
- [ ] Brief guardado en la ruta confirmada; `[PENDIENTE]` señalados.
