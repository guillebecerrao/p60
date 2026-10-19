# Cierre de Ciclo — Protocolo de retro y archivado (reference)

> Material profundo cargable on-demand. Detalla el protocolo de retrospectiva, las reglas de archivado a `_historia/` y el contrato de la bitácora agéntica.

## Modelo de sub-procesos (P60 v2)

El ciclo P60 v2 se compone de sub-procesos secuenciales: **Shape → Ideate → Validate → Handoff → Build → Experimentación**. Este skill cubre el cierre de los sub-procesos de discovery/handoff que producen artefactos de contexto: `shape`, `ideate`, `validate`, `handoff`.

**Ideate y Validate son sub-procesos separados** (a diferencia de v1, donde iban fundidos como "Ideate & Validate"). Cada uno tiene su propia retro y su propio ciclo de cierre.

## Paso 2 — Protocolo de retrospectiva

Cada sub-proceso mantiene su documento de retro acumulativo:

| Sub-proceso | Documento de retro |
|-------------|--------------------|
| Shape | `p60/shape/_retro/retro-shape.md` |
| Ideate | `p60/ideate/_retro/retro-ideate.md` |
| Validate | `p60/validate/_retro/retro-validate.md` |
| Handoff | `handoff/_retro/retro-handoff.md` |

Basándose en la sesión de trabajo y los artefactos generados, se proponen entradas para el documento correspondiente. La retro captura aprendizajes sobre el **proceso** (cómo trabajamos), nunca sobre el **producto** (qué construimos).

Estructura de cada entrada (ver también `templates/retro-entry.md`):

```markdown
## Ciclo [fecha o identificador]
**Fecha de cierre:** YYYY-MM-DD
**Participantes:** [lista]

### ¿Qué funcionó bien?
### ¿Qué fue difícil o generó fricción?
### ¿Qué cambiaríamos al próximo ciclo?
### Sugerencias de cambios al framework o estructura de carpetas
```

Presentar el borrador al usuario y **esperar aprobación antes de escribir** (puerta humana).

## Paso 3 — Reglas de archivado a `_historia/`

Identificar los artefactos activos del sub-proceso con `status: completed` y proponer moverlos a `_historia/` con el nombre `[archivo]_YYYY-MM-DD.md`. Esto materializa el principio constitucional #5: *la ubicación de un artefacto ES su estado*; madurar = mover físicamente el archivo.

**Importante:** presentar la lista de movimientos propuestos. **No ejecutar ningún movimiento sin confirmación explícita.**

El usuario puede:
- **Aprobar todos** → el LLM los ejecuta con `git mv`.
- **Aprobar algunos** → el LLM ejecuta solo los aprobados.
- **Diferir todos** → quedan documentadas las sugerencias en la retro para una reestructuración futura.
- **Rechazar** → no se mueve nada.

## Paso 4 — Contrato de la bitácora agéntica

Agregar una entrada en `p60/bitacora/bitacora-agentica.md` con:
- Fecha de cierre.
- Sub-proceso cerrado (`shape` / `ideate` / `validate` / `handoff`).
- Artefactos generados durante el ciclo.
- Decisiones clave tomadas.
- Estado: `completed`.
- Próximos pasos sugeridos (qué sub-proceso sigue o qué falta para el siguiente ciclo).

## Notas de alcance

- Este skill captura aprendizajes del **proceso**, no del producto. Los outputs del producto (OST actualizado, solución elegida, specs) se generan **dentro** del sub-proceso, no aquí.
- Los movimientos a `_historia/` son sugerencias, nunca acciones automáticas.
- Si el usuario no tiene tiempo para el cierre completo, al menos ejecutar el Paso 4 (bitácora agéntica) para preservar el contexto mínimo.
