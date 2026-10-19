# Estándar — formato `SKILL.md`

> Un skill es un **protocolo de tarea**: define *cómo ejecutar una actividad concreta*. Formato LLM-nativo con **progressive disclosure** — el agente carga solo lo que la tarea necesita.

## Tres niveles de carga (progressive disclosure)

1. **`skills/_index.md`** — índice barato de metadatos. Se lee primero para elegir el skill (~equivalente a `skills_list`).
2. **`SKILL.md`** — el protocolo accionable. Se abre completo solo cuando el skill matchea la tarea.
3. **`references/*.md`** — material profundo (teoría, tablas exhaustivas, ejemplos). Se abre **solo si la tarea lo pide**. Nunca por defecto.

Regla de oro: **el `SKILL.md` es lean.** Si una sección es material de consulta y no de ejecución, va a `references/`.

## Estructura de carpeta

```
skills/[nombre]/
├── SKILL.md                 # entry point accionable
├── [nombre].spec.md         # spec del componente (ver _standards/component-spec.md)
├── references/              # material cargable on-demand
└── templates/               # plantillas de output que el skill produce
```

## Frontmatter obligatorio de `SKILL.md`

```yaml
---
name: [nombre]                      # kebab-case, == carpeta
description: [una línea]            # con qué se decide relevancia. Empezar con verbo.
version: MAJOR.MINOR
status: active | draft | deprecated
triggers: ["crear ost", "priorizar oportunidades", ...]   # frases que activan el skill
requires_context: [archivos o toolsets que el skill necesita]
bibliography: [fuente, opcional]
last_sync: YYYY-MM-DD
---
```

## Cuerpo obligatorio — contrato de 4 secciones

```markdown
# [Nombre]

> Una línea de qué hace y a quién convierte en experto.

## When to Use
Cuándo activar (y cuándo NO). Bullets concretos.

## Procedure
Los pasos accionables, en orden. Compacto. Delegar la teoría profunda a `references/`
con un puntero explícito ("ver references/…"). Este bloque es lo que el agente ejecuta.

## Pitfalls
Anti-patrones y cómo detectarlos/corregirlos. Los más frecuentes primero.

## Verification
Cómo saber que el output está bien. Checklist o criterios de salida.
```

## Reglas
- **When to Use / Procedure / Pitfalls / Verification** son obligatorias; el resto es opcional y va a `references/`.
- Todo skill se registra en `skills/_index.md` al crearse.
- Todo skill tiene su `.spec.md` (constitución #1).
