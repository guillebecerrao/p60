# Config, History, naming y sync-log (reference)

> Detalle de la infraestructura que soporta el skill: el esquema de `_presentaciones-config.md`, la lógica de History/versionado, las convenciones de naming, y el sync-log de cambios transversales.

## Configuración de presentaciones — `presentaciones/_presentaciones-config.md`

Del Paso 3, se extraen tres bloques:

### 1. Guías visuales por artefacto
Preferencias de visualización registradas para cada artefacto (ej. "el OST se ve mejor con layout radial").
- **Si hay guías registradas:** aplicarlas estrictamente.
- **Si no hay guías:** generar con criterio propio basado en el design system, y al finalizar preguntar al usuario si quiere registrar alguna preferencia. Si el usuario indica preferencias, actualizar la config antes del cierre de sesión.

### 2. Documentos permanentes
Lista completa de los documentos permanentes registrados. Se usa para construir la sección "Documentos relacionados" del footer (Paso 6), con links relativos, excluyendo el propio documento y `home.html`. Cada entrada incluye, entre otros, la columna `Estado idiomas` y `Idioma base`.

### 3. Estado de idiomas del artefacto
Columna `Estado idiomas` de la tabla de documentos permanentes. Determina la rama de generación del Paso 6.
- Si el artefacto **no está registrado**, asumir `single_language`.
- Valores posibles: `single_language`, `multi_language_enabled`, `multi_language_paused` (ver `multi-language.md`).
- La config es la **fuente de verdad** del estado de idiomas. Las transiciones (activar / pausar / reactivar) se escriben en la config durante el Paso 4.

**Idioma base:** columna `Idioma base` en la config; si el artefacto no está registrado, usar `es`.

## History y versionado

La identificación del "mismo artefacto" se hace por **nombre-base** (`ost`, `como-trabajamos`), **no** por la fecha del nombre de archivo.

Al detectar una versión previa (Paso 4), el usuario elige:

- **Archivar:** mover el archivo actual a `presentaciones/History/`, **sobreescribiendo** si ya existe uno con el mismo nombre (History guarda solo la versión inmediatamente anterior, no un historial acumulado). Luego guardar el nuevo en `presentaciones/`.
- **Descartar:** generar el nuevo directamente en `presentaciones/`, sin mover nada a History.

Si se decidió archivar, el movimiento a History se ejecuta **antes** de guardar el nuevo archivo (Paso 7).

## Convención de naming de archivos HTML

El nombre depende de la **categoría** del documento, y es independiente del estado de idiomas (el multi-language vive dentro del archivo, no en el nombre):

| Categoría | Formato | Ejemplo |
|---|---|---|
| **Referencia** (doc vivo, sin versión de ciclo) | `nombre.html` | `ost.html` |
| **Ciclo** (artefacto de un ciclo y sub-proceso específico) | `nombre_subproceso-cNN-YYYY.html` | `plan-discovery_shape-c01-2026.html` |
| **Cross-ciclo** (artefacto que abarca varios ciclos) | `nombre_cNN-YYYY.html` | `vision-global_c01-2026.html` |

## Sync-log — `presentaciones/_sync-log.md`

El sync-log registra los cambios **transversales** al patrón de presentaciones, para propagarlos luego a Guilles-Universe.

### Chequeo de entrada (Paso 0)
Contar entradas con `Propagado: ❌ No`:
- **0 pendientes** → continuar sin comentar.
- **1-2 pendientes y recientes (<2 semanas)** → continuar sin comentar.
- **3+ pendientes, o alguna con +2 semanas sin propagar** → informar al usuario (sin bloquear el trabajo).

### Qué es un cambio transversal (Paso 8)
Un cambio es transversal si afecta la **arquitectura base que comparten todas las instancias** del patrón:
- Nueva disposición transversal en `_presentaciones-config.md`.
- Cambio en la convención de naming de archivos HTML.
- Cambio en la lógica de History o versionado.
- Cambio en la arquitectura de multi-idioma.
- Fix a un bug en el patrón base.

### Qué NO es transversal (no se registra)
- Guías visuales específicas de un artefacto (ej. "el OST se ve mejor con layout radial").
- Nuevos documentos permanentes en el registro.
- Cambios de estado de idiomas de un artefacto.

### Registro
Si hubo cambio transversal: agregar una entrada en `_sync-log.md` con el formato documentado ahí, marcada como `Propagado: ❌ No`. Si no hubo: no hacer nada.
