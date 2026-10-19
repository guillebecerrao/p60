---
type: adr
id: ADR-001
status: accepted
scope: framework
decision_owner: Guille Becerra O (Product Builder)
created: 2026-07-13
last_modified: 2026-07-13
supersedes: []
---

# ADR-001 — Interfaz context-repo ↔ codebase repo: pull-based

> Primera decisión estructural registrada del framework. Documenta la práctica vigente y la fija como contrato hasta que un ADR posterior la reemplace.

## Contexto

El contexto vive en un repo autocontenido separado del código (principio constitucional #3). El sub-proceso **Build** ocurre en el/los repo(s) de código. Falta definir cómo cruzan la frontera las specs congeladas (Iteration PRDs en `activas/`): ¿puntero, copia, submodule, MCP?

## Decisión

**Pull-based con copia como input.** Quien construye (dev team o agente en el repo de código) **busca el Iteration PRD aprobado en el context-repo** (`handoff-delivery/epicas/[epica]/features/[feature]/activas/`) y **lo lleva al repo de código como input del desarrollo** (típicamente copiándolo al workspace o referenciándolo en el prompt/contexto del agente constructor). El context-repo es la fuente; la copia en el repo de código es material de trabajo desechable.

Reglas que hacen viable este contrato:
1. El doc en `activas/` está **congelado**: no cambia durante la ventana de sprint sin comunicación explícita (constitución, regla 5). Por eso una copia no deriva.
2. La dirección es **una sola**: del context-repo hacia el código. Los hallazgos del build (decisiones técnicas, desvíos) vuelven como ADRs o updates al cierre — nunca editando la copia.
3. La sigla y trazabilidad (`EV-NNN`, nodo OST, épica/feature) viajan dentro del doc, así el constructor tiene el contexto completo sin acceso al resto del context-repo.

## Alternativas consideradas

| Alternativa | Pros | Contras | Por qué (no) se eligió |
|-------------|------|---------|------------------------|
| **Pull-based / copia (elegida)** | Cero acoplamiento entre repos; funciona hoy sin tooling; congelamiento hace segura la copia | Paso manual; riesgo de copiar versión vieja si se ignora el congelamiento | Es la práctica vigente y funciona; el costo de alternativas no se justifica aún |
| Git submodule del context-repo en el código | Versionado automático | Acopla los repos; fricción de submodules; expone TODO el contexto al repo de código | Rompe la separación que el principio #3 protege |
| Puntero (path/URL) sin copia | Sin duplicación | Exige que el constructor tenga acceso al context-repo en runtime; frágil para dev teams externos | Falla justo en el caso "dev team externo" que P60 soporta |
| MCP server del context-repo | Acceso programático controlado | Infraestructura que hoy no existe; prematuro | Candidato natural para revisitar en la fase de distribución |

## Consecuencias

- Habilita: Build con dev team externo o agente, sin tooling nuevo.
- Sacrifica: automatización de la entrega (aceptable a la escala actual).
- Deuda asumida: verificación manual de que la copia corresponde a la versión congelada vigente.
- Revisitar cuando: haya `p60 init`/CLI (la entrega podría automatizarse) o más de un squad consumiendo el mismo context-repo (evaluar MCP).

## Estado

`accepted` — práctica vigente documentada, confirmada por Guillermo (2026-07-13).

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 1.0 | 2026-07-13 | Claude Fable 5 (Product-Builder) | Creación — documenta la interfaz pull-based vigente (input de Guillermo, hallazgo H10 del análisis de mejoras). |
