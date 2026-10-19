---
title: "P60 — Framework Guide"
subtitle: "AI-Native Spec-Driven Product Building"
author: Guille Becerra O
created: 2026-07-08
last_modified: 2026-07-14
last_modified_by: Claude Fable 5 (Product-Builder)
version: 0.6
status: draft
audience: PM · Product Designer · Technical Lead · Solo-builder
language: es
---

# P60 — Framework Guide

> Guía de referencia del framework **P60** (descriptor técnico: *End-to-End Spec-Driven Product Building*).
> Objetivo de lectura: un PM, Designer o Tech Lead entiende de qué se trata y cómo operarlo en ~30 minutos.

---

## Brief

**P60 es un framework que lleva todo el trabajo de un Product Leader — descubrir oportunidades, priorizar, validar soluciones y especificar con precisión — a un repositorio de git operado con agentes de IA.** El resultado es un sistema operativo del producto que vive donde vive el código, sin Jira ni Notion obligatorios. Está pensado para tríadas de producto (PM + Designer + Engineer) y para el solo-builder que cubre los tres roles con agentes. Importa porque resuelve el problema que la era de la IA dejó abierto: no *cómo construir rápido* (eso ya está resuelto), sino **qué construir, por qué eso, y cómo darle al agente el contexto correcto para que construya lo que de verdad importa.**

---

## 1. Introducción — Contexto y filosofía

### El problema que P60 resuelve

La comunidad de IA ya resolvió el "cómo construir rápido". Con Claude Code, Cursor o cualquier LLM con acceso a un shell, un solo builder produce en horas lo que antes tomaba semanas. Ese cuello de botella desapareció.

El que **no** está resuelto es el que va antes: *¿qué construyo, por qué eso y no otra cosa, y cómo le paso al agente el contexto suficiente para que lo que construya realmente impacte al usuario en la dirección que le importa al negocio?* En la mayoría de los equipos esto sigue siendo informal, ad-hoc e inconsistente. Cuando el que construye es un agente, la ambigüedad se amplifica: un agente con contexto pobre construye rápido — la cosa equivocada.

### El nombre: la V60 de producto

**P60 hereda su nombre de la V60** — la cafetera de filtrado manual con su cono de 60 grados. La **P** es de producto. La metáfora es el modelo operativo del framework:

- **Los giros constantes** al verter el agua son el **discovery y delivery continuos**: nunca se detienen, se alternan en espiral durante todo el ciclo.
- **El filtro** es el **criterio**: no todo lo que se vierte pasa — la evidencia, los umbrales y el juicio humano filtran qué llega a construirse.
- **El goteo** es la **cadencia**: el valor sale en entregables regulares y acotados — tanto en discovery (snapshots, evidencia, decisiones) como en delivery (rebanadas verticales shippeables) — no en una gran entrega al final.

Café bien hecho no es agua vertida rápido: es giro constante, filtro que discrimina y goteo sostenido. Producto bien hecho, igual.

### La filosofía: nada se construye sin spec, ninguna spec sin evidencia

P60 parte de un principio de **Spec-Driven Development (SDD)**: la especificación es el artefacto central que guía diseño, implementación y validación. Y toda spec se respalda en evidencia. El ciclo completo es un loop de aprendizaje:

```
   Evidencia ──► Especificación ──► Implementación ──► Validación
       ▲                                                    │
       └──────────────────── Aprendizaje ───────────────────┘
```

> **Nada se construye sin spec. Ninguna spec se escribe sin evidencia. Todo lo construido se valida.**

Esto le garantiza al agente — y al equipo humano — el contexto correcto, en el momento correcto, para construir lo correcto. El repositorio no es un archivo de documentos: es el **sistema de contexto compartido** del squad, y crece con cada ciclo.

### Un matiz fundamental: la evidencia raíz es más amplia que el research de usuario

"Ninguna spec sin evidencia" suele reducirse a "ninguna spec sin research de usuario". P60 va un paso atrás: **la evidencia fundacional ancla en la estrategia del negocio** —modelo de negocio, estructura del equipo, estrategia empresarial, objetivos de corto/mediano/largo plazo— **pero no se limita a ella ni excluye al usuario.** El contexto fundante también puede traer evidencia de mercado y de usuario temprano: entrevistas, early adopters, señales de demanda. El punto es que la evidencia es más amplia que el research de usuario, y que sin esa base el discovery prioriza en el vacío. Por eso P60 abre con una **Etapa 0 de fundación de contexto** (§2) antes de cualquier ciclo de producto.

---

## 2. Core Concepts

P60 se compone de seis piezas que se refuerzan entre sí: **(a)** una topología de repositorios, **(b)** una Etapa 0 de fundación, **(c)** un pipeline de sub-procesos, **(d)** un sistema de documentación con lifecycle físico, **(e)** una capa agéntica (agentes, skills, memoria) y **(f)** una capa de cadencia (giro, filtro, goteo).

### 2.a — Topología: el contexto vive en su propia carpeta, por defecto en su propio repo

P60 —el contexto— vive **autocontenido en una carpeta `p60/`**, y **por defecto en un repositorio propio, separado del código**. Para proyectos chicos (una landing, un prototipo) se acepta instalarlo dentro del codebase: `p60 init` lo advierte y sugiere el repo separado, pero no lo impide. En los dos casos el contexto no se mezcla con el código, porque todo vive en `p60/`.

| Repo | Contiene |
|------|----------|
| **Context repo (P60)** | Discovery, specs, evidencia, artefactos del framework. El "OS del producto", autocontenido. |
| **Codebase repo(s)** | Código fuente. Uno o más, según arquitectura. Por defecto viven por separado; en proyectos chicos pueden alojar la carpeta `p60/`. |

Que el contexto sea autocontenido garantiza que cualquier sesión de trabajo tenga todo lo que necesita sin dependencias externas al repo.

**Cuántas personas operan el repo es una dimensión aparte, ortogonal a la topología.** En el mismo repo puede trabajar un solo **Product Builder**, una **tríada** (PM + Designer + Engineer) o el **squad completo**. La estructura no cambia. Lo único que escala con el número de personas es el **cuidado con las ramas y las ceremonias** para actualizar artefactos de forma coordinada (ver el modelo de branching de tres niveles: `main` ← `triada` ← `[sub-proceso]/ciclo`).

### 2.b — Etapa 0: Fundación de Contexto

Antes del primer ciclo se configura la base. Es la evidencia raíz a la que todo lo demás se traza:

| Fundación | Qué captura |
|-----------|-------------|
| **Negocio** | Modelo de negocio, estrategia empresarial, objetivos corto/mediano/largo plazo |
| **Mercado / Usuario temprano** | Contexto de mercado y evidencia de usuario disponible al inicio: entrevistas, early adopters, señales de demanda (si existe) |
| **Equipo** | Estructura organizacional, composición del squad, roles, modelo de trabajo |
| **Dominio** | Glosario, design system semilla, tech-stack y ADRs iniciales |

Esta etapa es el objetivo del comando `p60 init` (ver §4). No es un trámite: es lo que ancla la trazabilidad de toda oportunidad y toda spec al negocio.

### 2.c — El pipeline de sub-procesos

El trabajo se organiza en un pipeline. Cada sub-proceso tiene su carpeta, su índice de contexto (`_contexto/indice-contexto.md`, que define qué subset del repo cargar) y sus artefactos.

```
Etapa 0      1. Shape      2. Ideate      3. Validate      4. Handoff      5. Build      6. Experimentación
Fundación ─► Descubrir  ─► Generar     ─► Validar       ─► PRD validado ─► Speckit /  ─► Validación
de negocio   y priorizar   ideas de       supuestos con     + ADR →          dev team     post-build
             oportunidad   solución       prototipos        dev-ready                     (loop cierra)
```

| Sub-proceso | Propósito | Cierra con |
|-------------|-----------|-----------|
| **Shape** | Descubrir y priorizar oportunidades | Nodo hoja del OST elegido con criterio explícito |
| **Ideate** | Generar ideas de solución para la oportunidad elegida | Candidatas preseleccionadas |
| **Validate** | De-riskear y validar supuestos de las candidatas | Solución elegida con evidencia (PRD-brief `selected`) |
| **Handoff** | Convertir la solución en specs de desarrollo | Iteration PRD `approved` por todos |
| **Build** | Materializar las specs en producto funcional | Producto deployado y verificado |
| **Experimentación** | Validar lo construido con uso real (A/B, fake door…) | Decisión ship/no-ship/iterar; spec `validated` |

**Fuente única del OST.** El *Opportunity Solution Tree* (`contexto/estrategia/ost.md`) es la columna vertebral: toda oportunidad, solución y spec se traza a un nodo. Nunca se copia ni duplica.

**Bypass con ADR.** Un sub-proceso puede omitirse si su output ya existe o su propósito no aplica (ej. infraestructura pura salta Shape/Ideate/Validate), siempre que se documente en un ADR. El bypass es una regla del framework, no una excepción; lo que no se permite es omitir sin justificación.

### 2.d — Sistema de documentación: niveles + jerarquía épica/feature + fidelidad + ubicación como estado

La documentación de producto se organiza por **niveles** (dueño y horizonte distintos) y por **jerarquía** (una épica gobierna sus features):

| Nivel | Artefacto | Alcance | Qué es |
|-------|-----------|---------|--------|
| **1** | **PRD-brief** | Candidata de solución | Documento ligero. Nace en Validate, siembra un **prototipo de baja fidelidad**. Estados: `draft` / `selected` / `discarded` |
| **2 · Maestro** | **PRD Maestro** | **Épica** | Documento estratégico **vivo** de la épica. Se actualiza a medida que sus features mutan o se agregan. No "se cierra" mientras la épica viva |
| **2 · Feature** | **PRD de feature** (+ **ADR** + **prototipo alta-fi**) | **Feature** | El PRD-brief seleccionado que maduró a validado. **Gobernado (subrogado) por el PRD Maestro** de su épica |
| **3** | **Iteration PRD** | Sprint | Input ejecutable acotado, sin preguntas abiertas |

**Jerarquía épica → feature.** Una épica tiene su carpeta con el **PRD Maestro** y, debajo, una carpeta por cada feature que va saliendo, cada una con su **propio PRD** gobernado por el maestro. Así se tiene visión global sin repetir, y se mantiene coherencia entre features:

```
handoff-delivery/epicas/[epica-slug]/
├── prd-maestro.md                    ← PRD Maestro: gobierna la épica, se actualiza siempre
└── features/[feature-slug]/
    ├── prd-[feature].md              ← PRD de feature (validado) + ADR + prototipo alta-fi
    ├── activas/[NN]-[slug].md        ← Iteration PRD en ventana de sprint (congelado)
    └── cerradas/[NN]-[slug].md       ← Iteration PRD ya implementado (respaldo-como-contexto)
```

> **PRD Maestro ≠ feature validada.** Que una feature tenga su PRD validado es distinto de que el maestro esté "listo": el maestro es un documento vivo de la épica que nunca deja de evolucionar mientras entran o mutan features. Un PRD-brief puede dar origen a una **épica nueva** (con su Maestro) o a una **feature** —nueva o un ajuste— que se acomoda bajo una épica existente; la misma jerarquía los absorbe sin duplicar.

Dos dimensiones se montan encima de estos niveles:

**Fidelidad del prototipo acompaña la madurez.** El PRD-brief arranca con un prototipo de **baja fidelidad** para de-riskear barato en Validate; a medida que la evidencia confirma supuestos, madura a **alta fidelidad** junto al PRD de feature validado.

**La ubicación del archivo ES su estado — y cada ubicación tiene un contrato de mutabilidad.** Un documento no solo cambia un campo `status`: **se mueve físicamente** de carpeta al madurar, y la carpeta donde vive declara si puede tocarse:

| Ubicación | Momento del lifecycle | Contrato de mutabilidad |
|-----------|----------------------|------------------------|
| `ideate-validate/oportunidades/[opp]/[idea]/` | Ideación / validación temprana | **Libre** — se itera sin fricción |
| `handoff-delivery/epicas/[epica]/features/[feature]/activas/` | Aprobado, en ventana de sprint (`in_dev`) | **Congelado** — no se modifica sin comunicar al equipo que construye |
| `.../features/[feature]/cerradas/` + `_historia/` | Ya implementado | **Respaldo-como-contexto** — inmutable; alimenta decisiones futuras, no se borra |

> Este es el valor de memoria del framework: los docs de cosas ya implementadas no se archivan y se olvidan — quedan como contexto de respaldo que el agente lee para decidir mejor la próxima vez.

### 2.e — Capa agéntica: agentes, skills, memoria

| Pieza | Qué es | Ejemplos |
|-------|--------|----------|
| **Agentes** (`agentes/`) | System prompts que activan un perfil experto | Product Management, Spec-Driven Development, Ingeniería, Product Design |
| **Skills** (`skills/`) | Protocolos de *cómo ejecutar una tarea concreta*, cargados bajo demanda. Los 6 sub-procesos tienen cobertura | OST facilitator, ideación estructurada, assumption testing, redactar PRD, diseñar experimento, decisión ship, bibliotecario de evidencia, cierre de ciclo |
| **Memoria** | Contexto persistente entre sesiones | `CLAUDE.md` (reglas de navegación), `bitacora/` (registro agéntico + humano) |

El agente lee `CLAUDE.md` al inicio, recupera contexto de la bitácora, carga el índice del sub-proceso activo, y opera bajo reglas explícitas (fuente única del OST, no leer `_historia/` por defecto, toda spec nace `draft`, puerta humana según el contrato de mutabilidad, etc.).

**Agentes nativos.** Los perfiles expertos están publicados como subagentes nativos de Claude Code (`.claude/agents/`): el harness los descubre y delega automáticamente según la tarea, con contexto aislado y posibilidad de trabajo en paralelo. Los system prompts canónicos siguen en `agentes/` (fuente única); el registry (`.p60/registry/agents.yaml`) gobierna el scaffolding.

**Sistema de evidencia (bibliotecario).** "Ninguna spec sin evidencia" tiene mecanismo: todo material bruto (transcripciones, analytics, informes) entra por `contexto/evidencia/_inbox/`; el skill `bibliotecario-evidencia` lo identifica, crea su **ficha `EV-NNN`** (resumen + hallazgos + dónde está cada cosa en el original), archiva el original en su carpeta de destino y actualiza el índice. Investigar contexto interno es leer **índice → fichas → recién entonces el original** — nunca al revés. Los artefactos (OST, PRDs) citan la sigla `[EV-NNN]`, que es estable aunque los archivos se muevan.

### 2.f — La cadencia: giro, filtro, goteo

La metáfora de la V60 (§1) se operacionaliza en tres ritmos que corren **en paralelo al pipeline**, no después de él:

**El giro — discovery y delivery continuos.** El contacto con usuarios es **semanal durante todo el ciclo** — nunca se concentra "al inicio": cada semana deja al menos un touchpoint (entrevista, test, dato) convertido en snapshot/ficha y, si corresponde, una actualización del OST. El delivery corre en paralelo: mientras una feature se construye, el discovery de la siguiente ya gira.

**El filtro — criterio en tres checkpoints de juicio humano.** Hay tres decisiones que el agente prepara pero **nunca toma**:
1. **Qué perseguir:** el outcome y la oportunidad target los fija el humano (Shape) — igual que la preselección de candidatas (Ideate) y la apuesta con **apetito fijo**: cuánto vale este problema en tiempo/esfuerzo se decide *antes* de diseñar la solución, y la solución se diseña dentro de ese límite.
2. **Qué cuenta como evidencia:** toda síntesis generada por IA (snapshots, fichas, resúmenes) se **valida por el humano antes de entrar al OST o a un PRD** — los resúmenes automáticos pierden detalle y matiz; el filtro es humano.
3. **Qué se consolida:** ship / no-ship / iterar es decisión humana con los resultados del experimento a la vista (`decision-ship`).

**Circuit breaker:** lo que no cabe en su apetito **no se extiende por defecto** — vuelve a Shape/Ideate re-dimensionado, con ADR. Con agentes construyendo, "seguir intentando" parece gratis; no lo es: consume el ciclo y esconde que el problema estaba mal dimensionado.

**El goteo — entregables regulares y acotados.** El valor sale en gotas verificables: cada Iteration PRD es una **rebanada vertical** shippeable; cada semana de discovery deja artefactos catalogados; cada experimento tiene **fecha de corte pre-registrada**. Al cierre de cada sub-proceso, el `cierre-de-ciclo` incluye un espacio de **cool-down**: retro, mantenimiento del repo y mejora de los propios skills antes de la siguiente apuesta.

**Vía rápida (rigor proporcional al tamaño).** Un ajuste menor a una feature ya validada no repite el pipeline completo: entra como Iteration PRD directo bajo su PRD de feature, con nota de bypass. El bypass documentado ya existía para sub-procesos; esta regla lo gradúa por tamaño del cambio — el filtro discrimina también cuánto proceso merece cada gota.

---

## 3. Workflow típico — de `init` a MVP

Un recorrido concreto por un ciclo completo:

1. **`p60 init`** — se crea el Context repo y se completa la **Etapa 0**: negocio, equipo, dominio. Queda la evidencia raíz.
2. **Shape** — con la estrategia como base, se mapean y priorizan oportunidades en el OST. Cierra con un **nodo hoja elegido** con criterio explícito de sizing.
3. **Ideate** — para esa oportunidad se generan ideas de solución y se preseleccionan candidatas.
4. **Validate** — cada candidata arranca un **PRD-brief** + **prototipo de baja fidelidad**; se identifican y validan supuestos con evidencia real. La ganadora queda `selected`.
5. **Handoff** — el PRD-brief seleccionado madura a **PRD de feature validado + ADR + prototipo alta-fi**, bajo el **PRD Maestro** de su épica (que se actualiza para reflejar la nueva feature). Se descompone en **Iteration PRDs** dev-ready (user stories con criterios de aceptación, casos de borde, requerimientos técnicos resueltos). Al aprobarse, el doc se mueve a `activas/` — y se congela.
6. **Build** — las specs se materializan. Cuando construye un agente, lo orquesta **Speckit** (`constitution → specify → plan → tasks → analyze → implement`); cuando construye un dev team externo, recibe las specs aprobadas y usa su propio proceso.
7. **Experimentación** — lo construido se valida con uso real. La decisión (ship/no-ship/iterar) cierra el loop; la spec pasa a `validated` y su Iteration PRD se mueve a `cerradas/` como respaldo-de-contexto.

Cada cierre de sub-proceso dispara una retro de proceso, una actualización de la bitácora y — opcionalmente — una presentación HTML ejecutiva para stakeholders. El OST se actualiza en cada etapa.

---

## 4. Extensibilidad

P60 se adapta a un dominio nuevo sin reescribirse:

- **Bypass de sub-procesos.** No todo producto necesita los seis. Oportunidad obvia → salta Shape. Solución conocida → salta Ideate/Validate. Producto existente → entra desde su estado actual. Cada salto se documenta con un ADR.
- **Escala de equipo.** Un PB solo, una tríada o el squad completo operan la misma estructura de repo autocontenido; lo único que escala con el número de personas es el rigor de ramas y ceremonias.
- **Skills y agentes propios.** Añadir un protocolo de tarea o un perfil experto es crear un archivo en `skills/` o `agentes/` con su frontmatter — el agente lo descubre y lo carga bajo demanda.
- **i18n.** El framework opera en **ES / EN / PT (pt-BR)**: `p60 init --lang` genera el context repo con el contenido en el idioma elegido. Los **nombres de carpetas son canónicos** y no se traducen — son la lógica del pipeline (los skills y agentes los referencian); lo que se localiza es el contenido.
- **`p60 init` operativo.** `tools/p60 init <producto> --escala pb|triada|squad --lang es|en|pt` instancia el context repo completo: estructura, semillas (OST, evidencia, bitácoras) en el idioma elegido, agentes y skills conectados y guardarraíles instalados. La fundación se puebla después con el skill `fundacion-etapa-0` (entrevista guiada). Onboarding con ejemplos: `docs/arranque-rapido.md`.

---

## Changelog

| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 0.1 | 2026-07-08 | Claude (Product-Builder) | Creación inicial. Documenta P60 v2: Etapa 0 de fundación de contexto, split Ideate/Validate, sistema de doc reconciliado (3 niveles + fidelidad de prototipo + ubicación-como-estado con contratos de mutabilidad). Borrador para revisión de Guillermo. |
| 0.2 | 2026-07-08 | Claude (Product-Builder) | Feedback de Guillermo: (1) topología fija — contexto siempre en repo autocontenido separado del código; "modos" ya no son topología sino escala de equipo (PB/tríada/squad), ortogonal, que solo escala rigor de ramas/ceremonias. (2) Corrección conceptual PRD Maestro (de la épica, vivo) vs PRD de feature validado; jerarquía `epicas/[epica]/features/[feature]/` con el maestro gobernando/subrogando las features. |
| 0.3 | 2026-07-08 | Claude (Product-Builder) | Feedback de Guillermo: matiz de evidencia raíz reformulado — no es "de negocio y no de usuario", sino "más amplia que el research de usuario": ancla en estrategia de negocio pero también admite mercado y usuario temprano (entrevistas, early adopters, señales de demanda). Nueva fila "Mercado / Usuario temprano" en la tabla de Etapa 0. |
| 0.4 | 2026-07-13 | Claude Fable 5 (Product-Builder) | Pasada Fable 5 + input de Guillermo: (1) origen del nombre — metáfora V60 (giro=discovery/delivery continuo, filtro=criterio, goteo=cadencia); (2) nueva pieza §2.f capa de cadencia: touchpoint semanal, apetito fijo + circuit breaker, 3 checkpoints de juicio humano, cool-down, vía rápida; (3) sistema de evidencia bibliotecario (fichas EV-NNN) documentado en §2.e; (4) agentes nativos de Claude Code (`.claude/agents/`); (5) cobertura completa de skills en los 6 sub-procesos. |
| 0.5 | 2026-07-14 | Claude Fable 5 (Product-Builder) | Onboarding: `p60 init` pasa de futuro a operativo (§4), con `fundacion-etapa-0` como pieza agent-driven y `docs/arranque-rapido.md` como guía de capacitación. HTML regenerado y sincronizado a esta versión. i18n operativo en init: `--lang es\|en\|pt` (pt-BR) — contenido localizado, carpetas canónicas. |
| 0.6 | 2026-10-19 | Claude Opus 5.5 (Product-Builder) | §2.a: el contexto vive en `p60/`; repo propio por defecto, dentro del codebase como opción aceptada con advertencia (constitución 2.3). |
