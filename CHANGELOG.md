# Changelog

Versiones del framework P60. Cada versión es un tag `vX.Y.Z` en GitHub; `install.sh` instala el último release y `p60 update` lleva cada producto a la versión del CLI instalado.

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
