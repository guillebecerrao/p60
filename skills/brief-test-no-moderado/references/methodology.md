# Brief de Test No Moderado — Metodología (reference)

> Material profundo cargable on-demand: fundamentos, principios, diseño de bloques, banco de preguntas por paso y tabla de umbrales.

## Fundamentos

### Propósito del brief

Un brief de test no moderado es un **artefacto de planificación y ejecución** que traduce hipótesis de diseño en tareas y preguntas configurables. A diferencia de un test moderado:

- El facilitador **no puede intervenir** — las instrucciones deben ser autosuficientes.
- El estímulo es **fijo** (imagen o prototipo), no adaptable en tiempo real.
- La escala es **mayor**: 30–100 participantes con bajo costo relativo.
- Los datos son **cuantitativos** por defecto — las respuestas abiertas son un complemento.

### Tipos de estímulo

| Tipo | Cuándo usarlo | Limitación |
|------|--------------|------------|
| **Imágenes estáticas (export de diseño)** | Validar comprensión de pantallas finales o near-final | No permite medir navegación ni flujo |
| **Prototipo interactivo (link)** | Validar flujos, navegación y usabilidad funcional | Requiere prototipo estable; más tiempo de configuración |

### Principios de diseño del brief

1. **Un brief, un objetivo de validación.** No mezclar comprensión, usabilidad y expectativas sin un hilo conductor claro.
2. **Las instrucciones deben ser autosuficientes.** El participante no tiene a nadie que aclare sus dudas.
3. **Baseline antes del estímulo.** Siempre incluir al menos una pregunta pre-task para medir el punto de partida y calcular deltas.
4. **Máximo 5 tareas por test.** Tests más largos degradan la calidad. Si hay más de 5 tareas, separar en dos tests.
5. **Cada tarea mide una sola cosa.** No combinar "¿Qué entiendes?" con "¿Dónde harías click?" en la misma instrucción.
6. **Los umbrales de validación se definen antes de ver los resultados.** Escribir los criterios de éxito en el brief, no después de analizar los datos.

## Diseño de los bloques (Paso 3 en detalle)

**Bloque 0 — Segmentación y reclutamiento.** Documenta los criterios del Paso 2. Indicar si el reclutamiento es por panel de la herramienta o por base de datos propia (sin preguntas de filtro).

**Bloque 1 — Pre-task: Baseline.** Mide comprensión ANTES del estímulo.
- Máximo 2–3 preguntas de opción múltiple. No mostrar retroalimentación.
- Deben ser las mismas que el post-task para poder calcular deltas.

**Bloque 2 — Design survey: Tareas sobre el estímulo.** El núcleo del test. Tipos de tarea:
- a) Comprensión general (abierta)
- b) Comprensión de elemento (abierta)
- c) First click
- d) Expectativa de acción (abierta)
- e) Navegación (solo prototipos)

**Bloque 3 — Post-task: Comprensión.** Opción múltiple con respuesta correcta e incorrectas (trampas). En espejo con el Bloque 1. Incluir siempre la opción "Sigo sin saberlo".

**Bloque 4 — Post-task: Usabilidad / Expectativas.**
- a) Relevancia percibida (Likert 1–5)
- b) Claridad (Likert 1–5)
- c) Abiertas opcionales (máx. 2)

## Banco de preguntas por paso

Preguntas guía que el agente hace al usuario, en orden, sin volcarlas todas de golpe.

**Paso 0 — Contexto de la feature**
1. ¿Cuál es el nombre de la feature o pantalla que vas a testear?
2. ¿Qué hipótesis quieres validar con este test?
3. ¿A qué nodo(s) del OST está vinculado este test? (si aplica)
4. ¿Tienes ya un diseño listo, o el test se hará sobre un estado anterior?

**Paso 1 — Estímulo**
5. ¿Cuál es el tipo de estímulo? (a) imágenes estáticas (b) prototipo interactivo
6. ¿Tienes el link de preview disponible? (uno por segmento si hay 2+)
7. Si es imágenes: ¿cuántas pantallas/estados? Si es prototipo: ¿cuál es el flujo a recorrer?

**Paso 2 — Segmentos y reclutamiento**
8. ¿Cuántos segmentos tiene el test? (1 o 2 es lo más común)
Por cada segmento:
9. ¿Nombre del segmento?
10. ¿Perfil de reclutamiento? (antigüedad, actividad, categoría, u otro criterio relevante)
11. ¿Qué versión del diseño ve este segmento? (si hay diferencias)
12. ¿Cuántos participantes por segmento? (mínimo 20 para datos cuantitativos confiables)

**Paso 3 — Bloques**
13. ¿Qué conceptos clave quieres medir antes vs. después? (B1/B3)
14. ¿Qué quieres que haga el participante al ver el diseño? (tipos de tarea a/b/c/d/e — B2)
15. ¿Hay algún elemento específico del que quieras saber si el usuario lo entiende o encuentra?
16. ¿Qué dimensión quieres medir al final? (relevancia / claridad / abiertas — B4)

**Paso 4 — Análisis**
17. ¿Quieres ajustar alguno de los umbrales estándar para tu test específico?

## Tabla de umbrales de validación (Paso 4)

Proponer estos estándar y pedir confirmación:

| Tipo de métrica | Umbral estándar sugerido |
|----------------|--------------------------|
| Delta de comprensión (Bloque 1 → Bloque 3) | Mejora ≥ 15 pp |
| Tasa de "Sigo sin saberlo" post-test | < 20% |
| First click en zona correcta | ≥ 60–70% |
| Promedio Likert (relevancia o claridad) | ≥ 3.5 / 5 |
| Respuestas abiertas que mencionan concepto clave | ≥ 70% |
| Scroll depth (si la herramienta lo mide) | ≥ 60% llega al final |

## Rutas de guardado (Paso 6)

Vinculado a una oportunidad:
```
ideate-validate/oportunidades/[oportunidad]/[idea]/guia-test.md
```
Sin oportunidad específica:
```
ideate-validate/tests/guia-test_[feature]_[YYYY-MM-DD].md
```
El agente confirma la ruta antes de guardar.

## Comportamiento esperado del agente

**Al iniciar**
1. Anunciar que hará el levantamiento de contexto antes de diseñar el brief.
2. Hacer las preguntas en orden — no volcar todas de golpe.
3. Registrar como `[PENDIENTE]` los datos que el usuario aún no tenga.
4. Si la hipótesis es vaga, ayudar a precisarla antes de avanzar.

**Durante el diseño**
- Construir las preguntas post-task en espejo de las pre-task.
- Proponer las opciones incorrectas (trampas) — siempre al menos una plausible.
- Limitar las tareas a 5 por test — si el usuario pide más, proponer dividir y explicar por qué.

**Al finalizar**
- Presentar el brief completo listo para guardar.
- Confirmar la ruta de archivo antes de escribir.
- Señalar qué campos quedaron como `[PENDIENTE]`.
- Recordar lanzar un piloto interno de 1–2 personas antes del lanzamiento real.
