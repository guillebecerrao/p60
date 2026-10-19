---
name: actualizar-bitacora-humana
description: Consolida las notas personales del equipo en la bitácora humana compartida, en orden cronológico y con revisión humana previa.
version: 2.0
status: active
triggers: ["actualiza la bitácora humana", "consolida las notas", "sync bitácora", "actualizar bitácora"]
requires_context: ["bitacora/bitacora-humana.md", "trabajo-individual/*/notas/"]
last_sync: 2026-07-08
---

# Actualizar Bitácora Humana

> Convierte al agente en el consolidador de la memoria humana del equipo: recoge las notas personales nuevas y las integra en la bitácora compartida sin perder ni duplicar información.

## When to Use

Actívalo cuando cualquier miembro del equipo quiera **consolidar sus notas personales** en la bitácora humana compartida. Se puede invocar en cualquier momento; no requiere estar en ningún sub-proceso específico.

**Activación típica:** el usuario dice "actualiza la bitácora humana", "consolida las notas" o "sync bitácora".

**NO** lo uses para: escribir notas personales (eso lo hace cada persona en su carpeta), ni para consolidar decisiones de sistema o specs (eso vive en la bitácora técnica, no en la humana).

## Procedure

1. **Identificar el período.** Lee `bitacora/bitacora-humana.md` y registra la fecha de la última entrada. Ese es el corte para lo nuevo.
2. **Localizar notas nuevas.** Revisa las carpetas de notas de **todas** las personas del equipo y quédate solo con archivos con entradas **posteriores** a esa fecha:
   - `trabajo-individual/product-manager/notas/` — Product Manager
   - `trabajo-individual/product-designer/notas/` — Product Designer
   - `trabajo-individual/product-engineer/notas/` — Product Engineer
   - `trabajo-individual/coach/notas/` — Coach / Advisor _(si aplica)_
   - Los archivos siguen el patrón `YYYY-WW_[persona].md` (ej. `2026-13_product-manager.md`).
3. **Extraer cada entrada nueva** con estos campos: **Fecha**, **Persona**, **Tipo** (`reunion` / `decision` / `aprendizaje` / `accion` / `bloqueo`), **Sub-proceso** (`shape` / `ideate-validate` / `handoff` / `general`) y **Contenido** (resumen conciso, 1-3 líneas).
4. **Presentar al usuario** las entradas a agregar **antes de escribirlas**, para que pueda corregir o descartar alguna. Puerta humana obligatoria.
5. **Escribir la bitácora.** Una vez aprobado, inserta las entradas en `bitacora/bitacora-humana.md` en **orden cronológico** y actualiza el campo `last_modified`.

> Formato de salida de cada entrada: **`templates/entrada-bitacora.md`**.

## Pitfalls

- **Escribir sin aprobación** → el paso 4 (puerta humana) es obligatorio; nunca modifiques la bitácora antes de mostrar las entradas.
- **Re-consolidar entradas ya existentes** → duplicados. Corta siempre por la fecha de la última entrada de la bitácora, no por la de la última corrida.
- **Copiar la nota entera** → la bitácora es un resumen (1-3 líneas por entrada), no un volcado del texto libre de la persona.
- **Romper el orden cronológico** → inserta en el lugar correcto, no solo al final.
- **Olvidar actualizar `last_modified`** → deja la próxima corrida sin corte fiable.

## Verification

- [ ] Todas las notas nuevas (posteriores a la última entrada) de todas las personas fueron revisadas.
- [ ] Cada entrada tiene Fecha, Persona, Tipo, Sub-proceso y Contenido conciso.
- [ ] El usuario aprobó las entradas antes de la escritura.
- [ ] Entradas insertadas en orden cronológico; sin duplicados.
- [ ] `last_modified` actualizado en `bitacora/bitacora-humana.md`.
