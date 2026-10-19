---
type: experimento
id: EXP-NN
sub_proceso: experimentacion
feature: [feature-slug]
iteration_prd: [ruta]
nodo_ost: [nodo]
metodo: ab | antes-despues | rollout-gradual | fake-door
status: diseñado                # diseñado | running | leído | decidido
fecha_lanzamiento: YYYY-MM-DD
fecha_corte: YYYY-MM-DD
created: YYYY-MM-DD
---

# EXP-NN — [Feature] · [Método]

> **Pre-registro:** el umbral y la ventana se definen ANTES de exponer usuarios y no se modifican después.

## Promesa a validar
Outcome del nodo OST que la feature prometía mover: [comportamiento medible].

## Diseño
- **Método:** [y por qué es el más barato con señal para este caso]
- **Segmento/asignación:** [quiénes, cómo se parte]
- **Métrica primaria:** [la del outcome]
- **Secundarias:** [contexto]
- **Guardarraíles:** [lo que no puede empeorar + umbral de alarma]

## Umbral pre-registrado
> Éxito si **[métrica primaria]** [mejora ≥X% | supera Y] con [ventana/n mínimo], al corte del **[fecha]**.

## Instrumentación
| Evento/dato | ¿Existe ya? | Verificado el |
|-------------|-------------|---------------|

## Resultados (se completa al corte)
| Métrica | Control/antes | Variante/después | Δ |
|---------|---------------|-------------------|---|

Lectura: [qué dicen los datos, incluidos guardarraíles]. → La decisión se toma con `decision-ship`.

## Changelog
| Version | Date | Author | Description |
