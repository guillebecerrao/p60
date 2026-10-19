---
name: decision-ship
description: Facilita la decisión ship / no-ship / iterar de un experimento leído — contrasta resultados contra el umbral pre-registrado, prepara la recomendación y cierra el loop de aprendizaje en el repo.
version: 1.1
status: active
triggers: ["decidir el experimento", "ship o no ship", "leer los resultados del experimento", "cerrar el experimento", "qué hacemos con la feature", "decisión de lanzamiento"]
requires_context: ["el experimento EXP-NN con resultados al corte", "el Iteration PRD / PRD de feature correspondiente", "p60/contexto/estrategia/ost.md"]
last_sync: 2026-10-19
---

# Decisión Ship / No-Ship / Iterar

> Cierra el loop del framework: `…Implementación → Validación → Aprendizaje`. El agente prepara la lectura y la recomendación; **la decisión es del humano**.

## When to Use

Actívalo cuando un experimento llegó a su **fecha de corte** con resultados, y hay que decidir **ship / no-ship / iterar** y propagar las consecuencias en el repo.

**NO** lo uses para: diseñar el experimento (eso es `disenar-experimento`), ni para la retro de proceso del ciclo (eso es `cierre-de-ciclo`).

## Procedure

1. **Leer contra el pre-registro — y solo contra él.** Resultado de la métrica primaria vs. el umbral escrito antes de correr. Guardarraíles revisados. Los análisis exploratorios se marcan como tales: informan la *próxima* hipótesis, no esta decisión.
2. **Preparar la lectura honesta**: qué pasó, con qué confianza (n, ventana, anomalías), qué dicen los guardarraíles. Si la señal es insuficiente, la lectura es "insuficiente" — no se estira a favor.
3. **Recomendar con las tres opciones sobre la mesa**:
   - **Ship** — umbral cumplido, guardarraíles sanos → consolidar al 100%.
   - **Iterar** — señal parcial o hallazgo accionable → qué cambiar y qué se re-testea (nueva iteración con su experimento).
   - **No-ship** — umbral fallado o guardarraíl roto → retirar/apagar; el aprendizaje vale más que el sunk cost.
4. **Decisión humana (checkpoint de juicio, no delegable).** El humano decide con la lectura a la vista. Se registra en el doc del experimento: decisión, quién, cuándo, criterio.
5. **Propagar en el repo** (presenta el plan de movimientos antes de ejecutar):
   - Iteration PRD → `validated` y **se mueve a `cerradas/`** (respaldo-como-contexto).
   - PRD Maestro: actualizar el índice/estado de la feature.
   - **OST**: registrar el resultado en el nodo (outcome movido o no — evidencia nueva).
   - Resultado fichado como evidencia (`bibliotecario-evidencia` → nueva sigla EV, citable en el futuro).
   - Si no-ship/iterar: el aprendizaje vuelve a Shape/Ideate como input explícito.
6. **Bitácora**: entrada con la decisión y el porqué (una fila; el detalle vive en el doc del experimento).

## Pitfalls

- **Mover el umbral con los datos a la vista.** La forma más común de auto-engaño. → El pre-registro manda; lo demás es exploratorio.
- **"Ship porque ya está construido".** Sunk cost. → No-ship es un resultado exitoso del framework: evitó consolidar algo que no mueve el outcome.
- **Decidir sin guardarraíles.** Primaria verde + churn rojo = no está verde. → Guardarraíles son parte del criterio, no adorno.
- **Cerrar sin propagar.** La decisión que no llega al OST/Maestro/fichas se pierde como aprendizaje. → El paso 5 es parte de la decisión, no un trámite posterior.
- **El agente decide.** El agente lee, recomienda y propaga; la decisión con trade-offs de negocio es humana. → Paso 4 explícito siempre.

## Verification

- [ ] Lectura contrastada contra el umbral pre-registrado (sin re-interpretación post-hoc).
- [ ] Recomendación con las tres opciones evaluadas y guardarraíles incluidos.
- [ ] Decisión registrada con autor humano, fecha y criterio.
- [ ] Propagación completa: Iteration PRD a `cerradas/` + Maestro + OST + ficha EV del resultado.
- [ ] Entrada en la bitácora; aprendizaje enrutado a Shape/Ideate si no-ship/iterar.
