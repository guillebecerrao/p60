---
name: disenar-experimento
description: Diseña el experimento de validación post-build de una feature — método (A/B, fake door, rollout gradual, cohorte), métrica primaria, umbral de éxito pre-registrado y plan de corrida.
version: 1.1
status: active
triggers: ["diseñar el experimento", "cómo validamos lo construido", "a/b test de la feature", "fake door", "plan de experimentación", "validación post-build"]
requires_context: ["el Iteration PRD / PRD de feature construido", "p60/experimentacion/pipeline.md", "outcome del nodo OST correspondiente"]
last_sync: 2026-10-19
---

# Diseñar Experimento

> Convierte al agente en diseñador de experimentos del sub-proceso **Experimentación**: lo construido se valida con uso real, contra un umbral definido antes de mirar los datos.

## When to Use

Actívalo cuando una feature (o rebanada) salió de **Build** deployada y hay que **diseñar cómo se valida con uso real**, o al planificar el pipeline de experimentación de un ciclo.

**NO** lo uses para: tests de supuestos pre-build (eso es `assumption-testing`, con prototipos), ni para tomar la decisión final (eso es `decision-ship`, con los resultados en la mano).

## Procedure

1. **Recuperar la promesa.** Del PRD de feature y su nodo OST: ¿qué outcome (cambio de comportamiento medible) prometía mover esta feature? El experimento mide **eso** — no clicks genéricos ni "engagement".
2. **Elegir el método más barato que dé señal real**, según tráfico y riesgo:
   | Situación | Método |
   |-----------|--------|
   | Tráfico suficiente para partir | **A/B** (control vs. variante) |
   | Poco tráfico | **Antes/después con cohorte** (misma métrica, ventanas comparables) |
   | Riesgo alto / reversibilidad dudosa | **Rollout gradual** (5% → 25% → 100% con criterios de avance) |
   | Validar demanda antes de invertir más | **Fake door / smoke test** |
3. **Definir métricas**: **una primaria** (la del outcome), 1–2 secundarias de contexto y **guardarraíles** (lo que no puede empeorar: churn, errores, latencia, quejas).
4. **Pre-registrar el umbral y la duración**: "éxito si [métrica primaria] mejora ≥X% con [ventana/n] — decidimos el [fecha]". Escrito **antes** de exponer usuarios; sin extensión silenciosa de la ventana ("seguir mirando hasta que dé" invalida el experimento).
5. **Plan de corrida** en `p60/experimentacion/experimentos/[NN]-[slug].md` (template `templates/experimento.md`): asignación/segmento, instrumentación necesaria (verificar que el evento existe ANTES de lanzar), fecha de corte, responsable de la lectura.
6. **Registrar en el pipeline** (`p60/experimentacion/pipeline.md`) y dejar el experimento `running`. Al llegar la fecha de corte → `decision-ship`.

## Pitfalls

- **Métrica de vanidad como primaria.** Clicks suben y el outcome ni se movió. → La primaria es la del nodo OST, siempre.
- **Umbral post-hoc.** Con datos a la vista todo umbral se racionaliza. → Pre-registrado en el paso 4, sin excepción.
- **Instrumentación después del launch.** Se pierde la ventana limpia. → Verificar eventos antes de exponer usuarios.
- **Extender la ventana "para estar seguros".** Peeking + extensión = falso positivo casi garantizado. → La fecha de corte se respeta; si la señal es insuficiente, esa ES la lectura.
- **Experimento sin guardarraíles.** La primaria mejora mientras el churn sube. → Guardarraíles explícitos en el paso 3.

## Verification

- [ ] Métrica primaria = outcome del nodo OST; guardarraíles definidos.
- [ ] Umbral, ventana y fecha de corte pre-registrados en el doc del experimento.
- [ ] Método justificado contra tráfico/riesgo (el más barato con señal).
- [ ] Instrumentación verificada antes del lanzamiento.
- [ ] Experimento registrado en `pipeline.md` con estado y fecha de corte.
