---
component: context-repo
type: template
version: 2.2
status: draft
agent_role: architect
last_sync: 2026-10-19
depends_on: [constitution, artifacts, bibliotecario-evidencia, p60-cli]
---

> **Estado:** 2.0 es el contrato de destino (portable, sobre carpeta existente). Lo implementado hoy en `tools/p60` es el 1.1 (ver changelog). Vuelve a `active` cuando la implementación cumpla los criterios de `tools/_specs/p60-cli.spec.md`, fases 1 y 2.

# Template de context-repo — Spec

## Propósito
Definir la estructura canónica y los archivos semilla del context repo de un producto, tal que `p60 init` instancie un repo operable de inmediato (Etapa 0 lista para poblar con `fundacion-etapa-0`).

## Contrato
- **Input (de `p60 init`):** carpeta destino (vacía o existente, con o sin git; puede ser un codebase, con advertencia), nombre del producto (kebab-case, por defecto el de la carpeta), escala (pb/triada/squad), idioma (`es` | `en` | `pt` — pt-BR), herramientas (`--tools`, v1: `claude`).
- **Output:** la carpeta queda como context repo: esqueleto completo de carpetas (README del template = fuente de la estructura), semillas con placeholders resueltos (`[PRODUCTO]`, `[FECHA]`), OST semilla, todo dentro de una carpeta visible `p60/`, con el núcleo del framework vendorizado en `p60/_framework/` (versión, config, manifiesto), y capa agéntica generada en la raíz por el adaptador de cada herramienta (para `claude`: `.claude/agents/` con rutas relativas a `p60/_framework/agents/`, `.claude/skills/` como copias, hook fusionado en `.claude/settings.json`). Layout detallado en `tools/_specs/p60-cli.spec.md`.
- **Invariantes:** el context repo es **autocontenido** (sin rutas absolutas ni symlinks hacia fuera; funciona clonado en cualquier máquina); el framework se **vendoriza** en `p60/_framework/` y se actualiza solo con `p60 update`; los archivos existentes del equipo nunca se reemplazan (bloques con marcadores o merge); `git init` solo si no había repo; los placeholders no sobreviven a la instanciación.

## Archivos semilla del conjunto
| Semilla | Rol |
|---------|-----|
| `CLAUDE.md` | Navegación + estado del ciclo + resolver "dónde va cada cosa" |
| `framework.md` | Puntero al framework + adaptaciones locales |
| `p60/contexto/evidencia/_index.md` | Catálogo de fichas EV (primera parada de búsqueda) |
| `p60/bitacora/bitacora-{agentica,humana}.md` | Memoria de sesiones / notas del equipo |
| `p60/experimentacion/pipeline.md` | Estado vivo de experimentos |
| `p60/contexto/estrategia/ost.md` | OST semilla (fuente única) — la genera `p60 init` |

## Criterios de aceptación
- [ ] `p60 init` corre limpio y el repo resultante pasa la revisión de estructura (carpetas del README presentes).
- [ ] Ningún placeholder `[PRODUCTO]`/`[FECHA]` queda sin resolver, y `[RUTA_P60]` ya no existe en los templates.
- [ ] El repo generado no contiene rutas absolutas ni symlinks hacia fuera (criterios de portabilidad de `p60-cli.spec.md`, fase 1).
- [ ] Instanciar sobre una carpeta existente no reemplaza archivos del equipo.
- [ ] Hooks operativos en el repo instanciado (zonas congeladas piden confirmación).
- [ ] i18n: los tres árboles de semillas (`es/`, `en/`, `pt/`) equivalentes en estructura y contenido; el OST semilla y los mensajes de `init` salen en el idioma elegido.
- [ ] Los nombres de carpetas NO se traducen (estructura canónica = lógica del pipeline).

## Decisiones (ADR inline)
- **CLI liviano + skill de fundación** (en vez de wizard monolítico): el CLI crea estructura (determinístico → código); la entrevista de fundación es juicio/síntesis (→ skill agent-driven). Es la doctrina latent/deterministic aplicada al onboarding.
- ~~**Skills por symlink, agentes por copia parametrizada**~~ *(reemplazada en 2.0)*. El symlink y la ruta absoluta ataban el repo al disco de quien lo creó: compartirlo por git dejaba skills y agentes rotos (contradice el principio 3). **Ahora:** todo se copia (vendorizado en `p60/_framework/` + adaptador), con manifiesto de hashes; las mejoras del framework llegan con `p60 update`, que muestra el plan y no pisa ediciones locales.

- **Carpetas canónicas, contenido localizado:** traducir nombres de carpeta rompería los `requires_context` de los skills y las referencias del framework. Es el principio i18n del guide ("se localiza sin tocar la lógica del pipeline") hecho regla verificable.

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 1.0 | 2026-07-14 | Claude Fable 5 (Product-Builder) | Creación — template completado (semillas) + contrato de `p60 init`. |
| 1.1 | 2026-07-14 | Claude Fable 5 (Product-Builder) | i18n operativo: árboles `en/` y `pt/` (pt-BR) completos; `p60 init --lang es\|en\|pt` con OST semilla y mensajes localizados; regla carpetas-canónicas/contenido-localizado. |
| 2.0 | 2026-10-19 | Claude Opus 5.5 (Product-Builder) | Draft del contrato portable: init sobre la carpeta actual (vacía o existente), git condicional, framework vendorizado en `.p60/` con manifiesto, adaptadores por herramienta, fin de symlinks y rutas absolutas. Pendiente de implementación. |
| 2.1 | 2026-10-19 | Claude Opus 5.5 (Product-Builder) | Layout: todo el contexto y el framework dentro de `p60/` (visible); framework en `p60/_framework/`. Fuera solo `.claude/` y un bloque en `CLAUDE.md` de la raíz. |
| 2.2 | 2026-10-19 | Claude Opus 5.5 (Product-Builder) | Admite instalar en un codebase con advertencia (constitución 2.3). |
