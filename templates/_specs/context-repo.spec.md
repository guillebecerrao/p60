---
component: context-repo
type: template
version: 1.0
status: active
agent_role: architect
last_sync: 2026-07-14
depends_on: [constitution, artifacts, bibliotecario-evidencia]
---

# Template de context-repo — Spec

## Propósito
Definir la estructura canónica y los archivos semilla del context repo de un producto, tal que `p60 init` instancie un repo operable de inmediato (Etapa 0 lista para poblar con `fundacion-etapa-0`).

## Contrato
- **Input (de `p60 init`):** nombre del producto (kebab-case), escala (pb/triada/squad), idioma (`es` | `en` | `pt` — pt-BR).
- **Output:** repo git inicializado con: esqueleto completo de carpetas (README del template = fuente de la estructura), semillas con placeholders resueltos (`[PRODUCTO]`, `[FECHA]`, `[RUTA_P60]`), OST semilla, capa agéntica conectada (`.claude/agents/` con rutas al framework, `.claude/skills/` symlinks, hooks de guardarraíles instalados).
- **Invariantes:** el context repo es autocontenido para operar (las semillas no dependen de red); el framework se referencia por `framework.md`, nunca se copia; los placeholders no sobreviven a la instanciación.

## Archivos semilla del conjunto
| Semilla | Rol |
|---------|-----|
| `CLAUDE.md` | Navegación + estado del ciclo + resolver "dónde va cada cosa" |
| `framework.md` | Puntero al framework + adaptaciones locales |
| `contexto/evidencia/_index.md` | Catálogo de fichas EV (primera parada de búsqueda) |
| `bitacora/bitacora-{agentica,humana}.md` | Memoria de sesiones / notas del equipo |
| `experimentacion/pipeline.md` | Estado vivo de experimentos |
| `contexto/estrategia/ost.md` | OST semilla (fuente única) — la genera `p60 init` |

## Criterios de aceptación
- [ ] `p60 init` corre limpio y el repo resultante pasa la revisión de estructura (carpetas del README presentes).
- [ ] Ningún placeholder `[PRODUCTO]`/`[FECHA]`/`[RUTA_P60]` queda sin resolver.
- [ ] Hooks operativos en el repo instanciado (zonas congeladas piden confirmación).
- [ ] i18n: los tres árboles de semillas (`es/`, `en/`, `pt/`) equivalentes en estructura y contenido; el OST semilla y los mensajes de `init` salen en el idioma elegido.
- [ ] Los nombres de carpetas NO se traducen (estructura canónica = lógica del pipeline).

## Decisiones (ADR inline)
- **CLI liviano + skill de fundación** (en vez de wizard monolítico): el CLI crea estructura (determinístico → código); la entrevista de fundación es juicio/síntesis (→ skill agent-driven). Es la doctrina latent/deterministic aplicada al onboarding.
- **Skills por symlink, agentes por copia parametrizada:** los skills no necesitan contexto del producto (symlink basta y hereda updates del framework); los wrappers de agentes necesitan la ruta absoluta al prompt canónico (se genera al instanciar).

- **Carpetas canónicas, contenido localizado:** traducir nombres de carpeta rompería los `requires_context` de los skills y las referencias del framework. Es el principio i18n del guide ("se localiza sin tocar la lógica del pipeline") hecho regla verificable.

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 1.0 | 2026-07-14 | Claude Fable 5 (Product-Builder) | Creación — template completado (semillas) + contrato de `p60 init`. |
| 1.1 | 2026-07-14 | Claude Fable 5 (Product-Builder) | i18n operativo: árboles `en/` y `pt/` (pt-BR) completos; `p60 init --lang es\|en\|pt` con OST semilla y mensajes localizados; regla carpetas-canónicas/contenido-localizado. |
