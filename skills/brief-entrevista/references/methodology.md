# Brief de Entrevista — Metodología (reference)

> Material profundo cargable on-demand. Basado en Teresa Torres, *Continuous Discovery Habits* (2021), caps. 5–7.

## Fundamentos

### Propósito del brief

Un brief de entrevista es un **artefacto de planificación de sesión** que traduce los gaps del OST en preguntas ejecutables. Su función es:

1. **Focalizar** la sesión en los nodos con mayor vacío de evidencia — evitar dispersión.
2. **Guiar** al facilitador sin encorsetarlo — el brief es orientador, no un script.
3. **Calibrar** el perfil de participante para que la evidencia sea válida para el outcome.
4. **Documentar** el protocolo antes de la sesión para facilitar la replicación y la mejora iterativa.

### Principios de diseño

1. **Un brief, un conjunto de nodos relacionados.** No mezclar preguntas de ramas distintas del OST si no hay un hilo conductor entre ellas.
2. **Máximo 30 minutos por sesión.** El tiempo es un recurso escaso del participante. Diseñar para 30 minutos incluye buffer de cierre.
3. **Priorizar el nodo con mayor vacío de evidencia.** Si hay tres nodos, el de menor confianza va primero — si la sesión se corta, al menos se cubrió lo más crítico.
4. **Las preguntas no corrigen modelos mentales.** Si el participante cree algo incorrecto, eso es la evidencia. No aclarar durante la sesión.
5. **Historias específicas antes que opiniones.** Las preguntas principales buscan episodios reales; las sondas profundizan en ellos.

## Protocolo detallado por paso

### Paso 0 — Identificar los nodos a investigar

**Objetivo:** seleccionar los nodos del OST que justifican abrir una ronda de entrevistas.

1. Leer `contexto/estrategia/ost.md` — sección "Gaps estructurales y preguntas pendientes".
2. Identificar nodos por estado:
   - `HIPÓTESIS DE EQUIPO` → prioridad alta (sin ninguna evidencia de usuario).
   - `INFERIDO` → prioridad media (evidencia indirecta, pendiente de validación directa).
   - `EVIDENCIA DIRECTA débil` → prioridad media (n muy bajo, pendiente de replicar).
3. Agrupar nodos temáticamente relacionados — mismo momento del journey o mismo comportamiento del usuario.
4. Confirmar con el usuario cuáles nodos son el foco antes de continuar.

**Criterio de agrupación válida.** Un brief puede cubrir 2–3 nodos si:
- Pertenecen al mismo momento del journey, o
- Responden a un mismo tipo de perfil de participante.

Un brief NO debería cubrir nodos de ramas distintas que requieran perfiles de participante muy diferentes.

### Paso 1 — Definir el perfil de participante

| Elemento | Qué definir |
|----------|-------------|
| **Criterios de inclusión** | Comportamientos o situaciones que garantizan que el participante tiene experiencia directa con los nodos a investigar |
| **Criterios de exclusión** | Casos borde que contaminarían la evidencia |
| **Número de participantes** | 4–6 por ciclo como regla general. Ajustar si hay sub-perfiles que requieran representación |
| **Segmentación** | Especificar si aplica a todos los segmentos o hay foco (geográfico, de comportamiento, etc.) |
| **Priorización dentro del reclutamiento** | Si hay un sub-perfil más difícil de reclutar que provee evidencia más rica, mencionarlo explícitamente |

**Regla:** los criterios de inclusión deben estar directamente vinculados con los nodos. Si un criterio no es necesario para producir evidencia de ninguno de los nodos, eliminarlo.

### Paso 2 — Diseñar la estructura de la sesión

Distribuir 30 minutos en bloques que garanticen cobertura de los nodos prioritarios.

| Bloque | Tiempo sugerido | Propósito |
|--------|----------------|-----------|
| Apertura y contexto | 2–3 min | Presentación, consentimiento, objetivo de la sesión |
| Calentamiento | 3–5 min | Situar al participante en el journey; detectar perfil real vs. reclutado |
| Bloque por nodo (×N) | 6–10 min c/u | Un bloque por nodo o grupo de nodos relacionados |
| Cierre | 0–2 min | Espacio abierto para el participante |

**Reglas de distribución:**
- El nodo con mayor vacío de evidencia recibe el bloque más largo y va primero.
- El calentamiento no es prescindible — detecta si el participante realmente cumple el criterio de inclusión.
- El cierre es un seguro: si la sesión se extendió, se puede comprimir; si sobra tiempo, es espacio de exploración.

Al finalizar el diseño, incluir una nota de facilitación con la prioridad explícita de bloques.

### Paso 3 — Redactar las preguntas por bloque

Para cada bloque, diseñar 2–3 preguntas principales y sus sondas.

```
### Bloque [Nombre] — [Nodo(s) cubiertos] ([tiempo])

**Foco:** [sub-nodos específicos que se quieren investigar]

**Preguntas principales:**

1. *"[Pregunta de apertura de historia]"*
   > [Nota de facilitación: qué escuchar, cómo profundizar, qué no hacer]

2. *"[Pregunta de profundización]"*
   > [Nota de facilitación]

3. *"[Pregunta hipotética o de cierre del bloque]"* ← opcional, solo si aplica

**Sonda de cierre de bloque:**
- *"[Pregunta de transición o síntesis]"*
```

**Tipos de preguntas:**

| Tipo | Cuándo usarla | Ejemplo |
|------|--------------|---------|
| **De historia** | Para iniciar un bloque — busca episodios reales | *"¿Alguna vez intentaste X? ¿Qué pasó?"* |
| **De profundización** | Para entender el detalle de un paso | *"En ese momento, ¿qué hiciste exactamente?"* |
| **De modelo mental** | Para revelar cómo el usuario entiende un proceso | *"¿Qué esperabas que pasara cuando hiciste X?"* |
| **Hipotética** | Solo al final del bloque, con contexto previo | *"Si supieras de antemano que X tarda Y, ¿cambiaría tu decisión?"* |

**Anti-patrones en las preguntas:**

| Anti-patrón | Problema | Corrección |
|-------------|---------|-----------|
| Pregunta cerrada de apertura | No genera historia | *"¿Tuviste problemas?" → "¿Me cuentas la última vez que intentaste X?"* |
| Pregunta que contiene la hipótesis | Contamina la respuesta | *"¿Te cuesta hacer X?" → "¿Qué hiciste cuando quisiste hacer X?"* |
| Más de 3 preguntas principales por bloque | Sobrecarga la sesión | Priorizar 2 preguntas sólidas antes que 4 superficiales |
| Hipotética demasiado temprano | Sin contexto real previo, la respuesta es poco confiable | Siempre después de al menos una historia concreta |

### Paso 4 — Notas para el facilitador

Principios generales que aplican a toda la sesión. **Incluir siempre:**
- Cuándo no corregir modelos mentales erróneos (y por qué ese modelo mental es evidencia).
- El pedido de historias específicas vs. generalizaciones.
- Instrucción sobre grabación y consentimiento.
- Cualquier variación esperada por segmento que el facilitador deba tener en mente.

### Paso 5 — Próximos pasos post-entrevista

**Incluir siempre:**
- Documentar con el skill `interview-snapshot` dentro de las 24h.
- Condición específica bajo la cual se propone actualizar el OST.
- Condición bajo la cual un nodo sube de estado (ej. "si se confirma X, marcar el nodo como VALIDADO con n correspondiente").
- Condición bajo la cual se propone crear sub-nodos nuevos.

### Paso 6 — Producir el brief

Guardar en:
```
shape/guia-entrevistas/brief-entrevista_[nodos]_[YYYY-MM-DD].md
```
Formato del nombre: `brief-entrevista_[nodo1]-[nodo2]-[nodo3]_YYYY-MM-DD.md`.

## Comportamiento esperado del agente

### Al iniciar
1. Leer `contexto/estrategia/ost.md` — sección de gaps estructurales y preguntas para próximas entrevistas.
2. Proponer los nodos candidatos con su estado actual y justificación.
3. Confirmar con el usuario cuáles nodos serán el foco antes de diseñar nada.

### Durante el diseño
- **Justificar el orden de bloques:** explicar por qué el nodo X va primero.
- **Vincular cada pregunta a un nodo:** si una pregunta no puede rastrearse a un nodo del OST, eliminarla.
- **Proponer el perfil de participante basándose en la evidencia existente:** usar snapshots de entrevistas anteriores para calibrar.

### Al finalizar
- Presentar el brief completo listo para guardar.
- Indicar el nombre de archivo sugerido.
- Señalar si algún criterio de inclusión es difícil de cumplir en el reclutamiento actual y proponer ajuste.
