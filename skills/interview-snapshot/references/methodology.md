# Interview Snapshot — Metodología (reference)

> Material profundo cargable on-demand. Basado en Teresa Torres, *Continuous Discovery Habits* (2021), Cap. 5. Opera sobre transcripciones brutas generadas por IA (Gemini u otras) y produce un artefacto de síntesis de una sola página que alimenta el OST.

## Fundamentos teóricos (Torres, 2021)

### Qué es un interview snapshot

Un interview snapshot es un **artefacto de síntesis de una sola página** que captura lo más importante de una entrevista individual. Su propósito:

1. **Recordar** historias específicas semanas o meses después.
2. **Identificar** oportunidades e insights de cada entrevista.
3. **Construir** un banco de conocimiento del cliente con continuous interviewing.
4. **Compartir** los aprendizajes con equipo y stakeholders sin obligarlos a leer notas brutas.

### Componentes del snapshot

| Componente | Propósito |
|------------|-----------|
| **Nombre + Quick Facts** | Situar la historia en el contexto correcto; entender a qué tipo de usuario corresponde |
| **Quote memorable** | Ancla de memoria: un momento emocional o comportamiento distintivo en las palabras del participante |
| **Oportunidades** | Necesidades, pain points o deseos desde la perspectiva del usuario (no soluciones) |
| **Insights** | Observaciones interesantes que aún no encajan como oportunidades, pero vale registrar |

### Principios fundamentales

1. **La historia específica vale más que la generalización.** Lo que el usuario *hizo* en una instancia concreta es más confiable que lo que dice que *siempre hace*.
2. **Las oportunidades son necesidades, no soluciones.** Si el usuario pidió una feature, capturar la necesidad subyacente, no el pedido.
3. **Sintetizar inmediatamente.** El snapshot se crea justo después de la entrevista, con la memoria fresca. No esperar a un batch.
4. **Ser exhaustivo.** Aunque algo parezca único de este usuario, capturarlo. Lo anecdótico de hoy puede ser el patrón de mañana.

## Protocolo detallado por paso

### PASO 0 — Pre-procesamiento de la transcripción

**Objetivo:** Preparar la transcripción bruta antes de analizarla. Las transcripciones de IA tienen ruido estructural que debe resolverse antes de extraer insights.

1. **Identificar los speakers**
   - Gemini etiqueta por nombre cuando tiene acceso a los perfiles de Google Meet.
   - Confirmar con el usuario cuál speaker es el entrevistador y cuál(es) el/los participante(s).
   - Si hay más de un entrevistador, identificar quién conduce y quién observa.
2. **Filtrar ruido de transcripción**
   - Ignorar muletillas ("eh", "o sea", "como que", "este").
   - Normalizar frases cortadas o autocorregidas: quedarse con la versión final de lo que el speaker quiso decir.
   - Ignorar errores fonéticos obvios (nombres propios mal transcritos, tecnicismos distorsionados).
3. **Separar historia de generalización**
   - Marcar los fragmentos donde el participante cuenta una instancia específica ("la última vez que usé la app fue cuando...").
   - Marcar los fragmentos donde generaliza ("siempre hago X", "normalmente yo...").
   - El snapshot se ancla en las historias específicas; las generalizaciones son contexto secundario.
4. **Verificar completitud**
   - ¿Cubre inicio, medio y cierre de la entrevista?
   - ¿Hay fragmentos cortados o ilegibles que limiten el análisis? Mencionarlos en las notas del snapshot.

**Preguntar al usuario si:**
- No es posible identificar con certeza quién es el participante.
- Hay partes que parecen cortadas o que el usuario quiera aclarar.

### PASO 1 — Reconstruir la historia cronológicamente

**Objetivo:** Extraer la historia específica que contó el participante y ordenarla en línea de tiempo. Las historias aparecen fragmentadas: el participante salta entre pasado, presente, generalizaciones y pedidos de features. El documentador reconstruye la historia real.

1. Identificar la **pregunta generadora de historia** que usó el entrevistador ("Cuéntame sobre la última vez que...").
2. Extraer todos los fragmentos de esa historia específica (no las generalizaciones).
3. Ordenarlos cronológicamente: inicio de la situación → acciones → resultado / estado actual.
4. Identificar los **momentos clave**: ¿el detonante? ¿qué hizo paso a paso? ¿qué obstáculos encontró? ¿cómo terminó?

**Formato interno de trabajo (no va al output final):**
```
HISTORIA: [nombre del participante]
Detonante: [qué lo llevó a hacer lo que hizo]
Paso 1: [acción]
Paso 2: [acción]
...
Resultado: [cómo terminó / estado actual]
Momentos de fricción: [dónde hubo dificultad, confusión o frustración]
```

### PASO 2 — Extraer oportunidades

**Objetivo:** Identificar necesidades, pain points y deseos a partir de la historia reconstruida.

**Reglas de extracción:**
- Una oportunidad es una **necesidad, pain point o deseo** — nunca una solución ni una feature.
- Si el participante pidió algo concreto ("quiero notificaciones de millas"), preguntar "¿para qué necesita eso?" y capturar la necesidad subyacente.
- Expresar las oportunidades **en primera persona, con el lenguaje del participante**: no "los usuarios no entienden los beneficios" sino "no sé por dónde empezar a entender qué me da el programa".
- Incluir también las oportunidades que emergen de los **momentos de fricción**, aunque el participante no las haya articulado.

**Filtro de inclusión:**

| Criterio | Pregunta diagnóstica |
|----------|---------------------|
| ¿Es una necesidad o dolor, no una solución? | "¿Puede un usuario decirlo sin mencionar una feature?" |
| ¿Emergió de la historia específica? | "¿Sucedió en el relato, no en una generalización?" |
| ¿Podría conectarse al outcome del equipo? | "¿Resolverla podría mover la métrica que perseguimos?" |

**Anti-patrones a evitar:**

| Anti-patrón | Ejemplo | Corrección |
|-------------|---------|-----------|
| Oportunidad = solución | "Quiere notificaciones de estado de millas" | "No sabe cuándo se acreditarán sus millas y cuánto tiempo falta" |
| Oportunidad = generalización | "Siempre le cuesta entender los beneficios" | Solo si también apareció en la historia específica |
| Oportunidad = sentimiento sin causa | "Se frustra con la app" | "No puede completar [acción concreta] sin salir de la app" |
| Oportunidad demasiado amplia | "No entiende el programa" | "No sabe qué tiene que hacer para pasar al siguiente nivel de categoría" |

### PASO 3 — Extraer insights

**Objetivo:** Capturar observaciones relevantes que no encajan como oportunidades pero vale registrar.

Un **insight** es cualquier observación que:
- Revela algo sorprendente o no obvio sobre el comportamiento del usuario.
- Ayuda a entender el contexto del participante.
- Podría convertirse en oportunidad con más evidencia.

**Ejemplos válidos:**
- Un comportamiento inusual que solo este participante mostró.
- Una contradicción entre lo que dice que hace y lo que realmente hizo.
- Una creencia o modelo mental que influye en cómo interpreta el producto.
- Una forma no prevista de usar (o no usar) una funcionalidad.

**Nota:** Los insights no necesitan ser accionables ahora. Su valor es acumulativo — un insight solitario a menudo se vuelve patrón cuando aparece en tres o cuatro entrevistas más.

### PASO 4 — Completar los Quick Facts

**Objetivo:** Capturar los datos de contexto que permiten entender a qué tipo de usuario corresponde la historia. Varían según producto y tipo de usuario. Campos típicos:

| Campo | Qué capturar |
|-------|-------------|
| **País / región** | País o región de residencia del participante |
| **Perfil de uso** | Cómo y con qué frecuencia usa el producto o servicio |
| **Antigüedad como usuario** | Hace cuánto comenzó a usar el producto (o si es nuevo) |
| **Canal de llegada** | Cómo llegó al producto (recomendación, publicidad, búsqueda, etc.) |
| **Contexto de uso** | Situación en la que usa el producto (trabajo, personal, móvil, desktop, etc.) |
| **[Campo específico del dominio]** | _Agregar campos relevantes para el tipo de usuario entrevistado_ |

Adaptar los Quick Facts al dominio antes del primer ciclo de entrevistas. Agregar o quitar campos según la información disponible. No inventar datos que no aparecieron.

### PASO 5 — Seleccionar la quote memorable

**Objetivo:** Encontrar la frase que mejor ancla la memoria de la entrevista.

Una buena quote memorable:
- Es una frase exacta del participante (no una paráfrasis).
- Revela algo emocional, sorprendente o particularmente específico.
- Ayuda a distinguir a este participante de los demás.
- Puede ser breve — la brevedad la hace más memorable.

**Proceso:**
1. Identificar los 3–5 fragmentos más vividos o reveladores.
2. Elegir el que mejor "desbloquea" la memoria de la historia completa.
3. Transcribirla textualmente, respetando el lenguaje coloquial.

**Tip:** Las mejores quotes suenan a algo que solo esta persona podría decir.

### PASO 6 — Producir el snapshot

**Objetivo:** Compilar todo en el documento final usando `templates/snapshot.md`. Guardarlo en:

```
p60/shape/entrevistas/snapshots/snapshot_[nombre]_[fecha].md
```

Formato del nombre de archivo: `snapshot_nombre-apellido_YYYY-MM-DD.md`

## Comportamiento esperado del agente

### Al iniciar
1. **Solicitar la transcripción** si no fue provista: "¿Tienes la transcripción de la entrevista? Puedes pegarla directamente aquí."
2. **Confirmar speakers**: "¿Puedes confirmarme quién es el entrevistador para identificar bien las voces?"
3. **Preguntar por contexto mínimo** si no está en la transcripción (país, perfil de uso, frecuencia, etc.).

### Durante el análisis
- **Mostrar el trabajo**: al extraer oportunidades, indicar de qué fragmento de la historia provienen.
- **Distinguir historia de generalización**: cuando una oportunidad emerge de una generalización y no de la historia, mencionarlo y bajarle el peso relativo.
- **Preguntar ante ambigüedad**: si un fragmento podría ser oportunidad o insight, proponer ambas opciones y pedir criterio.
- **No fabricar datos**: si algo no está en la transcripción, no incluirlo. Dejar el campo vacío o marcarlo como "no mencionado".

### Al finalizar
- Presentar el snapshot completo en markdown listo para guardar.
- Indicar el nombre de archivo sugerido.
- Señalar explícitamente si hay oportunidades que podrían alimentar el OST actual.
- Sugerir si algún insight debería quedar en el plan de aprendizaje.

## Anti-patrones del documentador

| Anti-patrón | Por qué es problemático |
|-------------|------------------------|
| Mezclar lo que dijo el entrevistador con lo que dijo el participante | Contamina las oportunidades con las hipótesis del equipo |
| Capturar lo que el participante *dijo que haría* en lugar de lo que *hizo* | Las intenciones declaradas son menos confiables que el comportamiento pasado |
| Escribir las oportunidades en lenguaje de empresa o producto | Pierde la perspectiva del usuario; las oportunidades deben poder ser dichas por el participante |
| Sintetizar tanto que se pierde el detalle | El snapshot debe recordar la historia, no solo el resumen |
| Omitir oportunidades que "parecen únicas" | Lo único de hoy puede ser el patrón de mañana |
