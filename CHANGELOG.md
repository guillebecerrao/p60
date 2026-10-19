# Changelog

Versiones del framework P60. Cada versión es un tag `vX.Y.Z` en GitHub; `install.sh` instala el último release y `p60 update` lleva cada producto a la versión del CLI instalado.

## Sin publicar

- `p60 update` lista en el plan los metadatos que siempre cambian (`config.yaml`, `manifest.json`).
- `install.sh` (y por lo tanto `p60 self-update`) detecta que está actualizando y sugiere `p60 update` en cada producto. Rige desde la versión siguiente: el `self-update` corre el instalador de la versión que ya tienes.

## v2.1.1 — 2026-10-19

Ajustes del primer test real (la landing de P60 instalada con `install.md`).

- **`p60 lint` dentro de un producto** revisa el producto: archivos gestionados, hook, links rotos en `p60/` y catálogo de evidencia (`EV-NNN` sin ficha o sin fila en el índice). `p60 lint --framework` revisa la fuente del framework.
- **Salida limpia para agentes:** sin códigos de color cuando la salida no es una terminal, y respeta `NO_COLOR`.
- **Guardarraíl anclado a `p60/`:** carpetas del código con nombres como `legacy/` o `activas/` ya no piden confirmación.
- **Constitución 2.4:** la regla 13 (integridad verificable) usa `p60 lint`, que funciona dentro de cada producto.
- **Código en el mismo repo:** el `CLAUDE.md` del producto explica dónde va el código y cómo registrar un spike antes de la Etapa 0.
- README trilingüe (es/pt/en) y `docs/quickstart/etapas.json` como fuente única de las etapas.

## v2.1.0 — 2026-10-19

Primera versión distribuible.

- **Instalación en un comando:** `install.sh` (manual) e `install.md` (`curl … | claude`, agent-driven). Instala en `~/.p60` y `~/.local/bin`, sin sudo.
- **`p60 init` portable:** convierte la carpeta actual (nueva o existente, con o sin git) en context repo. Todo queda en `p60/` (framework vendorizado en `p60/_framework/`); afuera solo `.claude/` y un bloque en `CLAUDE.md`. Sin rutas absolutas ni symlinks: se comparte por git. Plan previo, `--dry-run`, colisiones con confirmación.
- **`p60 update`:** actualiza un producto sin pisar lo que el equipo editó (manifiesto con hashes, conflictos con `.p60-new`, borrado solo con confirmación).
- **`p60 doctor`** de instancia y **`p60 self-update`**.
- **Constitución 2.3:** el contexto vive autocontenido en `p60/`; repo propio por defecto, dentro de un codebase como opción aceptada con advertencia.
- Specs de las herramientas (`p60-cli`, `gate-zonas`, `p60-lint`); el lint valida el tipo `tool`.

## v2.0.0 — 2026-10-19

Publicación inicial del framework (pipeline de skills completo, agentes nativos, sistema de evidencia, guardarraíles como hooks, `p60 init` en ES/EN/PT).
