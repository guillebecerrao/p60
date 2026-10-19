---
component: p60-cli
type: tool
version: 0.2
status: draft
agent_role: architect
last_sync: 2026-10-19
depends_on: [context-repo, constitution, gate-zonas]
---

# p60 (CLI) — Spec

## Propósito
Instalar, instanciar y actualizar P60 de forma determinística: dejar el framework disponible en el computador (instalación global) y convertir cualquier carpeta en un context repo autocontenido, compartible por git y actualizable sin pisar el trabajo del equipo.

> **Estado:** spec de destino (v2 del CLI). Lo implementado hoy en `tools/p60` corresponde al contrato 1.1 de `templates/_specs/context-repo.spec.md` (repo nuevo `<producto>-context`, skills por symlink). Esta spec pasa a `active` cuando se cierren las fases 1 a 3.

## Contrato

### Comandos

| Comando | Qué hace | Dónde corre |
|---------|----------|-------------|
| `p60 init [RUTA] [flags]` | Convierte RUTA (default `.`; se crea si no existe) en un context repo | cualquier carpeta |
| `p60 update [--dry-run] [--yes]` | Lleva el context repo a la versión del framework que tiene el CLI instalado | dentro de un context repo |
| `p60 self-update [--to vX.Y.Z]` | Actualiza la instalación global del CLI y el framework | cualquier lugar |
| `p60 doctor` | Prerequisitos del entorno; dentro de un context repo, además: versión instalada vs. disponible, integridad del manifiesto, hook registrado | cualquier lugar |
| `p60 skills` · `p60 agents` | Listan skills y agentes (del context repo si estás en uno; si no, del framework instalado) | cualquier lugar |
| `p60 lint` | Integridad del repo del framework o del context repo | cualquier lugar |
| `p60 version` · `p60 help` | Versión del CLI y ayuda | cualquier lugar |

### Flags de `init`

| Flag | Default | Notas |
|------|---------|-------|
| `--producto NOMBRE` | nombre de la carpeta, normalizado a kebab-case | se confirma en el wizard |
| `--lang es\|en\|pt` | se pregunta (default `es`) | contenido localizado, carpetas canónicas |
| `--escala pb\|triada\|squad` | se pregunta (default `pb`) | |
| `--tools LISTA` | `claude` | lista separada por comas; v1 acepta solo `claude` (otro valor → error claro que lista los soportados) |
| `--dry-run` | — | imprime el plan (crear / fusionar / colisiones) y sale sin escribir. Es lo que usa `install.md` para pedir confirmación |
| `--yes` | — | no interactivo: acepta el plan, salvo colisiones (ver Invariantes) |

### Layout que produce `init`

Todo P60 vive en **una carpeta visible `p60/`** dentro de RUTA. Es el mismo layout para un context repo dedicado y (si se habilita, ver Pendientes) para un codebase. Lo único fuera de `p60/` es lo que la herramienta exige en la raíz.

```
<RUTA>/
├── CLAUDE.md                                ← si existe, se le agrega un bloque mínimo que apunta a p60/CLAUDE.md; si no, se crea con ese bloque
├── .claude/                                 ← adaptador `claude` (Claude Code solo lo busca en la raíz)
│   ├── settings.json                        ← hook gate-zonas fusionado
│   ├── agents/<id>.md                       ← wrappers → p60/_framework/agents/<id>.md
│   └── skills/<skill>/                      ← copia completa del skill
└── p60/
    ├── CLAUDE.md · README.md · framework.md ← del equipo (semillas localizadas)
    ├── contexto/ shape/ ideate/ validate/ handoff-delivery/ experimentacion/
    ├── bitacora/ presentaciones/ _historia/ legacy/
    └── _framework/                          ← gestionado por p60 (no se edita a mano)
        ├── VERSION                          ← versión del framework instalada
        ├── config.yaml                      ← producto, escala, lang, tools, installed_at, updated_at
        ├── manifest.json                    ← archivos gestionados + sha256 (incluye los de .claude/)
        ├── memory/constitution.md
        ├── registry/agents.yaml             ← rutas reescritas a p60/_framework/agents/
        ├── agents/<id>.md                   ← prompts canónicos
        ├── templates/artifacts/<lang>/
        ├── hooks/gate-zonas.sh
        ├── skills-index.md                  ← índice de skills con rutas del adaptador
        └── docs/  (P60-Framework-Guide.md, arranque-rapido.md, adr/)
```

- **`p60/` visible, no oculta:** es el trabajo del equipo (OST, PRDs, evidencia). Una carpeta con punto no se ve en Finder ni en muchos editores, y varias herramientas de búsqueda la omiten por defecto.
- **`_framework/` con guion bajo:** sigue la convención P60 de carpetas de sistema (`_inbox`, `_historia`, `_retro`): visible, primera en la lista, no se edita.
- **Rutas en skills y templates:** explícitas desde la raíz (`p60/contexto/evidencia/…`), no relativas a una convención.
- **Abrir la herramienta desde RUTA** (la raíz), no desde `p60/`. `doctor` lo verifica.

**Fuera de la instancia:** skills fuente, `_standards/`, specs de componentes, `tools/p60`, `p60-lint.sh`. Viven en la instalación global; la instancia trae solo lo que el agente lee en operación.

### Instalación global

- `~/.p60/versions/<versión>/`: árbol del framework de ese tag. `~/.p60/current` apunta a la versión activa.
- `~/.local/bin/p60` → `~/.p60/current/tools/p60`. Si `~/.local/bin` no está en el PATH, el instalador lo dice y muestra la línea a agregar. No edita archivos de shell.
- Fuente de releases: tags semver del repo `github.com/guillebecerrao/p60` (tarball `archive/refs/tags/vX.Y.Z.tar.gz`). El framework declara su versión en `VERSION` en la raíz.
- Canales: `install.sh` (manual, vía `curl` a bash) e `install.md` (agent-driven, vía `curl` a `claude`). Los dos terminan en el mismo `~/.p60` y producen el mismo manifiesto. `install.md` además ofrece el modo "solo este proyecto": descarga temporal → `init` → limpieza, sin instalación global.

### `manifest.json`

```json
{
  "framework_version": "2.1.0",
  "tools": ["claude"],
  "files": { "p60/_framework/agents/product-builder.md": "sha256:…", ".claude/skills/ost-facilitator/SKILL.md": "sha256:…" },
  "merged": {
    ".claude/settings.json": { "hooks.PreToolUse": "gate-zonas" },
    "CLAUDE.md": { "block": "P60", "sha256": "…" }
  }
}
```
`files` = archivos que p60 reemplaza completos. `merged` = archivos del equipo donde p60 solo es dueño de un fragmento (entrada de hook, bloque con marcadores). Todo lo que no aparece en el manifiesto es del equipo.

### Algoritmo de `update`

Para cada archivo, comparando el manifiesto instalado, el disco y la versión nueva:

| Situación | Acción |
|-----------|--------|
| Sin cambios locales, cambió en el framework | reemplaza |
| Editado localmente, sin cambios en el framework | conserva y avisa |
| Editado localmente y cambió en el framework | muestra diff y pregunta: mantener local / tomar nuevo / guardar el nuevo como `.p60-new` |
| Nuevo en el framework | agrega |
| Eliminado del framework | propone borrar; no borra sin confirmación (`--yes` no alcanza) |
| Fragmento `merged` | reaplica solo el fragmento |

Al final reescribe `VERSION`, `manifest.json` y `config.yaml` (`updated_at`). Siempre imprime el plan antes de aplicar; `--dry-run` solo imprime.

### Interfaz de adaptador (multi-herramienta)

Cada herramienta es un adaptador con tres funciones: `plan` (qué crearía o fusionaría y qué colisiones hay), `install` (escribe y registra en el manifiesto) y `capabilities` (qué guardarraíles soporta). Por ejemplo, `claude` tiene hooks nativos y otra herramienta puede tener `hooks: textual`, donde la puerta humana queda como instrucción escrita. El núcleo (`p60/`, semillas, git) no conoce ninguna herramienta. v1: solo `adapter_claude`.

### Invariantes

1. **Autocontenido:** ningún archivo del context repo contiene rutas absolutas ni symlinks hacia fuera del repo.
2. **No destructivo:** `init` nunca reemplaza un archivo existente del equipo. Fuera de `p60/` solo se toca `CLAUDE.md` de la raíz (bloque `<!-- P60:BEGIN -->…<!-- P60:END -->` que apunta a `p60/CLAUDE.md`) y `.claude/`. El `README.md` de la raíz no se toca. `settings.json` se fusiona como JSON, sin sobrescribir.
3. **Colisiones:** agente o skill con el mismo nombre, hook ya registrado o `p60/` existente → se listan en el plan. En modo interactivo se pregunta; con `--yes` o sin TTY, aborta (exit 2). Si `p60/_framework/` ya existe, `init` se niega y sugiere `update`.
4. **Git condicional:** si RUTA no está dentro de un repo git → `git init` + commit inicial. Si ya está en un repo → no commitea; informa qué agregó. Si RUTA es o está dentro de un repo *de código*, el comportamiento depende de la decisión pendiente P1 (ver Pendientes).
5. **Idempotencia:** re-ejecutar `init` o `update` sin cambios no modifica nada.
6. **i18n:** todo mensaje nuevo existe en es/en/pt. Las carpetas no se traducen.
7. **Sin privilegios:** nada usa sudo ni edita archivos de shell.
8. **Placeholders:** `[PRODUCTO]` y `[FECHA]` se resuelven. `[RUTA_P60]` desaparece de los templates y se reemplaza por `p60/_framework/` (rutas locales) y la URL del repo público (referencia).

### Códigos de salida
`0` ok · `1` error · `2` requiere confirmación (colisión en modo no interactivo) · `3` prerequisito faltante.

## Pendientes (decisión humana)

- **P1 — P60 dentro de un codebase.** El principio 3 de la constitución dice "el contexto vive en un repo autocontenido, separado del código. Sin excepción de mono-repo". Mientras no se enmiende, `init` sobre un repo de código **avisa y se niega** (exit 2), con `--allow-codebase` reservado para cuando el principio lo permita. Si se enmienda: `init` avisa y continúa.

## Criterios de aceptación

**Fase 1 — Portabilidad**
- [ ] `p60 init demo --lang es|en|pt` → `grep -rI "$HOME" demo` vacío y `find demo -type l` vacío.
- [ ] Fuera de `p60/`, `init` solo crea o modifica `CLAUDE.md` (bloque) y `.claude/`.
- [ ] Borrar o mover `~/.p60` después de `init` no rompe el context repo (agentes, skills y hook operan).
- [ ] Clonar el context repo en otra carpeta o máquina deja agentes, skills y hook operativos sin pasos extra.
- [ ] El hook sigue pidiendo confirmación en `activas/`, `cerradas/`, `_historia/` y `p60/_framework/memory/`.

**Fase 2 — Carpeta existente + adaptador**
- [ ] Carpeta con git y `CLAUDE.md` propio → `git status` muestra solo adiciones más el bloque P60; no hay commit nuevo.
- [ ] Carpeta sin git → queda con `git init` y un commit inicial.
- [ ] `settings.json` con hooks previos los conserva y suma `gate-zonas`.
- [ ] Colisión de skill o agente → aparece en `--dry-run`; con `--yes` sale con exit 2 sin escribir nada.
- [ ] `--tools cursor` → error claro que lista los adaptadores soportados.
- [ ] Re-ejecutar `init` se niega y sugiere `update`.

**Fase 3 — Update y doctor**
- [ ] Los seis casos de la tabla de `update`, cada uno con un test.
- [ ] `update` sin cambios disponibles → "ya estás al día", sin escrituras.
- [ ] `doctor` dentro de un context repo reporta versión, archivos gestionados editados y estado del hook.

**Fase 4 — Distribución**
- [ ] En una máquina limpia, `install.sh` deja `p60 version` funcionando sin sudo.
- [ ] `install.md` (agent-driven) produce el mismo `manifest.json` que el camino manual.
- [ ] `self-update --to vX.Y.Z` cambia `~/.p60/current` sin tocar ningún context repo.

**Transversal**
- [ ] `p60-lint` reconoce el tipo `tool` y valida esta spec.
- [ ] Mensajes en es/en/pt para cada comando nuevo.

## Decisiones (ADR inline)

- **Bash, sin Node (v1).** Node le da a OpenSpec un motor (TypeScript), un canal de distribución (npm) y comodidad para lógica compleja. P60 solo necesita el canal, y lo cubren `install.sh` + tags de GitHub. La fusión de JSON y los hashes se hacen con python3, que el hook ya exige. *Gatillo de revisión:* al agregar el segundo adaptador, evaluar migrar el CLI a Python o Node/TS.
- **Vendorizar en vez de symlinks.** Revierte la decisión 1.x ("skills por symlink, heredan updates"). El symlink ataba el repo al disco de quien lo creó y rompía el principio 3 (autocontenido). El costo (los updates ya no son automáticos) lo paga `p60 update` con manifiesto, que además hace explícito y revisable cada cambio del framework.
- **Manifiesto con hashes** como frontera de propiedad: permite actualizar sin pisar ediciones locales y sin pedirle al equipo que no toque nada.
- **CLI solo global; el repo registra la versión.** Una copia del CLI dentro de cada repo agregaba un segundo lugar que se desincroniza. El trabajo diario no necesita el CLI (solo Claude Code); solo `init` y `update` lo requieren.
- **La carpeta es el context repo** (no `<producto>-context` creado al lado). Coincide con cómo se trabaja en la práctica (crear la carpeta y abrir la herramienta) y habilita instalar sobre una carpeta que ya existe.
- **Sin prefijo en agentes y skills.** La carpeta es dedicada al producto, así que las colisiones son raras y se resuelven en el plan. El prefijo obligaba a renombrar referencias en el registry y los skills sin un beneficio práctico.
- **Skills solo en la carpeta de la herramienta** (no también en `p60/_framework/skills/`): evita duplicar. La fuente para generar adaptadores futuros es la instalación global, no el context repo.
- **`--dry-run` como base de la puerta humana del instalador:** el agente de `install.md` nunca escribe archivos; muestra el plan del CLI, pide confirmación y ejecuta.

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 0.1 | 2026-10-19 | Claude Opus 5.5 (Product-Builder) | Creación (draft). Contrato v2 del CLI: instalación global, init sobre carpeta existente, vendorizado en `.p60/`, manifiesto, update, adaptadores multi-herramienta. Decisiones D1–D6 de Guille Becerra O. |
| 0.2 | 2026-10-19 | Claude Opus 5.5 (Product-Builder) | Layout: todo dentro de una carpeta visible `p60/` (framework en `p60/_framework/`); fuera solo `.claude/` y un bloque en `CLAUDE.md`. Rutas explícitas `p60/…` en skills. Pendiente P1 (codebase vs. principio 3). |
