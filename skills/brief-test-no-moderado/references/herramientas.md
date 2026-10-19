# Herramientas de test no moderado (reference)

> Especificidades de configuración por herramienta. El brief es agnóstico de herramienta; esta guía traduce los bloques a la config concreta. Cargar solo si el usuario ya eligió herramienta o pregunta por una.

## Panorama

| Herramienta | Fuerte en | Notas |
|-------------|-----------|-------|
| **Lyssna** (ex UsabilityHub) | Design surveys, first-click, preference tests, five-second tests, card sorting | Referencia por defecto del skill. Panel propio o link de reclutamiento. |
| **Maze** | Prototype testing con métricas de flujo (misclick, time-on-task, heatmaps) | Ideal para estímulo (b) prototipo interactivo. Se conecta a Figma. |
| **UserTesting** | Panel amplio + video opcional | Mayor costo; útil cuando se quiere complemento cualitativo. |

## Mapeo de bloques → configuración

- **Bloque 1/3 (comprensión)** → preguntas de *opción múltiple*. Desactivar cualquier feedback/respuesta correcta visible al participante.
- **Bloque 2 tarea (c) First click** → configurar el estímulo como *first-click test* y definir el **área esperada** (zona correcta) para calcular la tasa de acierto.
- **Bloque 2 tarea (e) Navegación** → solo con estímulo prototipo; usar *prototype test* (Maze) con la ruta objetivo definida.
- **Bloque 4 Likert** → *opinion scale* 1–5.
- **Scroll depth** → solo si la herramienta lo mide nativamente; si no, omitir esa métrica del análisis.

## Reglas de configuración transversales

- **Un test por segmento y por idioma.** No mezclar idiomas ni versiones de diseño en un mismo test: distorsiona la comparación y el reclutamiento.
- **First clicks:** siempre definir el área esperada antes de lanzar, o no habrá zona de acierto contra la cual medir.
- **Retroalimentación desactivada** en todas las preguntas de comprensión (B1/B3).
- **Piloto interno** de 1–2 personas antes del lanzamiento real, para detectar instrucciones ambiguas.

## Checklist pre-lanzamiento (Paso 5, expandido)

- [ ] Exportar imágenes / confirmar que el prototipo está estable
- [ ] Crear test(s): uno por segmento y por idioma
- [ ] Configurar first clicks con área esperada (si aplica)
- [ ] Reclutar participantes según criterios del Bloque 0
- [ ] Desactivar retroalimentación en preguntas de comprensión
- [ ] Test piloto interno (1–2 personas) antes de lanzar
- [ ] Separar versiones por idioma si se lanza en varios mercados
