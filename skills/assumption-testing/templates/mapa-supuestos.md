---
type: mapa-supuestos
sub_proceso: validate
candidata: [nombre]
prd_brief: [ruta al PRD-brief]
status: draft                   # draft | en-test | resuelto
created: YYYY-MM-DD
last_modified: YYYY-MM-DD
---

# Mapa de supuestos — [Candidata]

> Trabaja junto al PRD-brief de la candidata. Los resultados vuelven al brief; este mapa es la mesa de trabajo del de-riskeo.

## Cadena de valor
El usuario [hace X] → obtiene [Y] → eso mueve [outcome del OST].

## Supuestos
| # | Supuesto | Tipo (D/U/V/F) | Riesgo si es falso | Evidencia actual | Desconocimiento |
|---|----------|----------------|--------------------|------------------|-----------------|
| S1 | | | alto/medio/bajo | [EV-NNN o "ninguna"] | alto/medio/bajo |

## Tests diseñados (los más riesgosos primero)
| Supuesto | Método (el más barato con señal) | Umbral de decisión (ANTES de correr) | Estado | Resultado + EV |
|----------|----------------------------------|--------------------------------------|--------|----------------|
| S1 | | "si [métrica] [</>] [valor] → falso" | diseñado/corriendo/resuelto | [EV-NNN] |

## Changelog
| Version | Date | Author | Description |
