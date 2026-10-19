---
name: cierre-de-ciclo
description: Cierra el ciclo de un sub-proceso — captura retro del proceso, propone archivado de artefactos y actualiza la bitácora agéntica.
version: 2.1
status: active
triggers: ["cerrar ciclo", "cerremos el ciclo", "hacer el cierre", "retro de shape", "retro de ideate", "retro de validate", "retro de handoff", "retrospectiva de sub-proceso"]
requires_context: ["[sub-proceso]/_retro/", "p60/bitacora/bitacora-agentica.md", "artefactos del ciclo con status: completed"]
last_sync: 2026-10-19
---

# Cierre de Ciclo

> Convierte al agente en facilitador del cierre de un sub-proceso: destila aprendizajes del **proceso** (no del producto), propone qué archivar y preserva el contexto para el siguiente ciclo.

## When to Use

Actívalo al **terminar un ciclo** de cualquier sub-proceso de P60 v2: **Shape**, **Ideate**, **Validate** o **Handoff**. Cada uno se cierra por separado y tiene su propia retro (Ideate y Validate son sub-procesos distintos, no uno solo).

**Activación:** el usuario dice "cerremos el ciclo", "hagamos el cierre", "retro de [sub-proceso]".

**NO** lo uses para: generar outputs de producto (OST actualizado, solución elegida, specs) — eso se produce **dentro** del sub-proceso, no aquí. Este skill solo captura aprendizaje de proceso y gestiona el archivado.

## Procedure

1. **Identificar el sub-proceso a cerrar.** Confirma con el usuario cuál: `shape`, `ideate`, `validate` o `handoff`.
2. **Proponer entradas de retrospectiva** para el doc del sub-proceso (`[sub-proceso]/_retro/retro-[sub-proceso].md`). Redacta el borrador con la plantilla y **preséntalo para aprobación antes de escribir**.
3. **Sugerir archivos a mover a `_historia/`.** Identifica artefactos activos con `status: completed` y propón moverlos como `[archivo]_YYYY-MM-DD.md`. Presenta la lista; **no muevas nada sin confirmación explícita** (puerta humana).
4. **Actualizar la bitácora agéntica** (`p60/bitacora/bitacora-agentica.md`) con la entrada de cierre del ciclo.
5. **Confirmar al usuario:** resume lo registrado y lo pendiente (movimientos diferidos, sugerencias de reestructuración futura).

> Protocolo de retro, reglas de archivado y contrato de la bitácora: **`references/retro-y-archivado.md`**.
> Formato de la entrada de retro: **`templates/retro-entry.md`**.

## Pitfalls

- **Capturar aprendizaje de producto en vez de proceso.** El OST, la solución y las specs no van en la retro. → Pregunta "¿esto es sobre *cómo trabajamos* o sobre *qué construimos*?".
- **Mover archivos sin confirmación.** Los movimientos a `_historia/` son sugerencias, nunca acciones automáticas. → Siempre presenta la lista y espera `PROCEED`.
- **Cerrar Ideate y Validate como uno solo.** En v2 son sub-procesos separados con retros separadas. → Confirma cuál se cierra antes de tocar `_retro/`.
- **Saltarse el cierre por falta de tiempo.** → Como mínimo ejecuta el Paso 4 (bitácora) para preservar el contexto; el resto puede diferirse.

## Verification

- [ ] Sub-proceso a cerrar confirmado explícitamente (`shape` / `ideate` / `validate` / `handoff`).
- [ ] Borrador de retro presentado y aprobado antes de escribir en `_retro/`.
- [ ] Lista de movimientos a `_historia/` presentada; ninguno ejecutado sin confirmación.
- [ ] Entrada en `p60/bitacora/bitacora-agentica.md` con estado `completed` y próximos pasos.
- [ ] Aprendizaje registrado es de **proceso**, no de producto.
- [ ] Pendientes (movimientos diferidos, sugerencias de reestructura) resumidos al usuario.
