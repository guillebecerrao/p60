---
title: "P60 — Arranque rápido"
subtitle: "De cero a primer ciclo, con ejemplos explícitos"
author: Guillermo Becerra
created: 2026-07-14
version: 1.0
status: active
audience: nuevo usuario de P60 (PM · Designer · Tech Lead · solo-builder)
language: es
---

# P60 — Arranque rápido

> Para capacitar o demostrar el framework: qué escribir, en qué orden, y qué esperar de vuelta. El método completo está en `P60-Framework-Guide.md` (30 min); esto es la versión "manos en la máquina" (10 min).

## 0. Prerequisitos

```bash
P60/tools/p60 doctor        # git, python3, Claude Code
```

## 1. Instanciar el producto (2 minutos)

```bash
P60/tools/p60 init mi-producto --escala pb --lang es    # escala: pb|triada|squad · idioma: es|en|pt (pt-BR)
cd mi-producto-context && claude
```

El contenido del repo se genera en el idioma elegido; los nombres de carpetas son estructura canónica del framework y no cambian entre idiomas.

Esto crea el **context repo**: estructura completa, OST semilla, sistema de evidencia, bitácoras, agentes y skills conectados, y guardarraíles instalados (las zonas congeladas piden confirmación humana automáticamente).

**Comandos útiles del CLI en cualquier momento:**

```bash
P60/tools/p60 skills    # qué sabe hacer el agente (y cuándo usar cada skill)
P60/tools/p60 agents    # los perfiles expertos y cuándo se activan
P60/tools/p60 lint      # integridad del repo del framework
```

## 2. Etapa 0 — Fundación (una sesión de ~30–45 min)

Dile al agente:

> **"Corre la fundación de contexto"** (skill `fundacion-etapa-0`)

Te entrevistará por bloques — negocio, mercado/usuario, equipo, dominio — y poblará `contexto/` validando cada bloque contigo. Si tienes material previo (entrevistas, métricas, informes), díselo: irá a `_inbox/` y quedará catalogado.

## 3. El ciclo — qué decir en cada sub-proceso

| Sub-proceso | Dile al agente… | Skill que se activa | Qué obtienes |
|-------------|-----------------|--------------------|--------------| 
| **Shape** | "Creemos el OST" / "prioricemos oportunidades" | `ost-facilitator` | Árbol outcome→oportunidades→soluciones; oportunidad target elegida **por ti** |
| | "Diseña una guía de entrevista para este nodo" | `brief-entrevista` | Guía de sesión ejecutable |
| | "Procesa esta transcripción" | `interview-snapshot` | Snapshot de 1 página listo para el OST |
| **Ideate** | "Generemos ideas para la oportunidad target" | `ideacion-estructurada` | ≥8 ideas → matriz → ~3 candidatas (las eliges tú) |
| **Validate** | "Mapea los supuestos de esta candidata" | `assumption-testing` | Supuestos rankeados + test más barato con umbral pre-registrado |
| | "Diseña el test no moderado" | `brief-test-no-moderado` | Brief listo para Lyssna/Maze |
| **Handoff** | "Madura el brief seleccionado a PRD" | `redactar-prd` | PRD Maestro + PRD de feature + Iteration PRDs dev-ready (congelados en `activas/`) |
| **Build** | *(en el repo de código)* — se lleva el Iteration PRD como input | — | Ver ADR-001: interfaz pull-based |
| **Experimentación** | "Diseñemos el experimento de esta feature" | `disenar-experimento` | A/B / fake door / rollout con umbral pre-registrado |
| | "Llegó el corte: decidamos" | `decision-ship` | Lectura honesta + recomendación; **decides tú**; repo propagado |
| **Transversal** | "Deja esto en el inbox" / "¿qué evidencia tenemos de X?" | `bibliotecario-evidencia` | Ficha `EV-NNN` + búsqueda índice→ficha→original |
| | "Cerremos el ciclo de Shape" | `cierre-de-ciclo` | Retro + archivado + bitácora |
| | "Genera el HTML del OST para presentarlo" | `generar-presentacion-html` | HTML ejecutivo para stakeholders |

## 4. Las tres decisiones que el agente NUNCA toma

El agente prepara, recomienda y propaga; **tú decides**: (1) el outcome y la apuesta (qué oportunidad, qué candidatas, cuánto apetito); (2) si una síntesis de IA entra al OST o a un PRD (tú la validas antes); (3) ship / no-ship / iterar.

## 5. Demo de 10 minutos (para mostrar el framework)

1. `p60 init demo-cafe` → mostrar la estructura creada y el `CLAUDE.md` (30 s).
2. "Corre la fundación" → responder 3–4 preguntas del bloque negocio → mostrar `contexto/negocio/` poblado (3 min).
3. Pegar una entrevista falsa en el chat → "procesa esta transcripción y déjala fichada" → mostrar snapshot + ficha `EV-001` + índice (3 min).
4. "Creemos el OST con esto" → mostrar el árbol con evidencia citada `[EV-001]` (2 min).
5. Intentar editar un archivo en `activas/` → **el guardarraíl pide confirmación humana solo** (30 s — siempre impresiona).
6. Cerrar con `p60 skills`: "todo esto es markdown versionado en git — sin Jira, sin Notion" (1 min).

## 6. Dónde seguir

- Método completo: `docs/P60-Framework-Guide.md` (o su `.html`).
- Principios y reglas: `.p60/memory/constitution.md`.
- Decisiones estructurales: `docs/adr/`.

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 1.0 | 2026-07-14 | Claude Fable 5 (Product-Builder) | Creación — guía de onboarding/capacitación con ejemplos explícitos y demo guiada. |
