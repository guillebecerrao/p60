---
title: "Guía de Test No Moderado — [Nombre de la feature]"
author: "[Squad] ([Nombre])"
created: YYYY-MM-DD
last_modified: YYYY-MM-DD
last_modified_by: "[Nombre] (con Claude Code)"
version: 0.1
modification_count: 0
status: draft
type: test-guide
tool: "[Lyssna / Maze / otra]"
linked_prd: "[ruta al PRD si existe]"
ost_nodes: [lista de nodos si aplica]
stimulus: "[Descripción del estímulo — tipo e imagen/prototipo]"
preview_url: "[URL de preview — o [PENDIENTE]]"
---

# Guía de Test No Moderado — [Nombre de la feature]

## Setup del test
| Parámetro | Valor |
|-----------|-------|
| **Tipo de test** | [Design survey con imágenes / con first click / Prototype test] |
| **Estímulo** | [Descripción] |
| **Participantes** | [N] por segmento — [panel / base de datos] |
| **Segmentos** | [Lista] |
| **Duración estimada** | [N–M] minutos |
| **Idioma(s)** | [Idiomas — lanzar por separado si son varios] |

## Bloque 0 — Segmentación y reclutamiento
> [Criterios de reclutamiento. Indicar si hay preguntas de filtro o reclutamiento por base propia.]

| | **Segmento A** | **Segmento B** |
|---|---|---|
| **Nombre** | [Nombre] | [Nombre] |
| **Perfil** | [Criterio] | [Criterio] |
| **Maqueta** | [Versión] | [Versión] |

## Bloque 1 — Pre-task: Baseline de comprensión
> Medir comprensión ANTES del estímulo. Opción múltiple, sin retroalimentación.
**Instrucción:** "Antes de mostrarte algo, queremos entender qué sabes hoy. No hay respuestas correctas ni incorrectas."

**P1.1** [Pregunta baseline] *(opción múltiple — una respuesta)*
- [Opción A] / [Opción B — correcta] / [Opción C — trampa] / No sé

## Bloque 2 — Design survey: [Nombre descriptivo]
> [Descripción del estímulo y en qué estado.]
**Instrucción de contexto:** "[Instrucción por segmento]"

**Tarea 1 — [Nombre]**
> "[Instrucción al participante]"
*[Tipo de respuesta]*

## Bloque 3 — Post-task: Comprensión
> Inmediatamente después de las tareas. En espejo con Bloque 1.
**P3.1** [Pregunta en espejo con P1.1] *(opción múltiple)*
- [Opción A — trampa] / [Opción B — correcta] / [Opción C — trampa] / Sigo sin saberlo

## Bloque 4 — Post-task: [Usabilidad / Expectativas]
**P4.1** ¿Qué tan [relevante / claro] es para ti [lo que viste]? *(Likert 1–5)*
**P4.2** [Pregunta abierta opcional — máx. 80 palabras]

## Criterios de análisis
| Métrica | Cálculo | Umbral de validación |
|---------|---------|---------------------|
| Delta de comprensión | % correcto P3.1 − % correcto P1.1 | ≥ 15 pp |
| "Sigo sin saberlo" post-test | % respuestas P3.x | < 20% |
| Promedio P4.1 | — | ≥ 3.5 / 5 |
| First click en zona correcta | — | ≥ 60–70% |

## Checklist antes de lanzar
- [ ] Exportar imágenes / confirmar estabilidad del prototipo
- [ ] Crear tests separados: uno por segmento y por idioma
- [ ] Configurar first clicks (si aplica)
- [ ] Reclutar según criterios del Bloque 0
- [ ] Desactivar retroalimentación en preguntas de comprensión
- [ ] Test piloto interno (1–2 personas) antes de lanzar
