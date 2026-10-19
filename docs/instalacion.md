---
title: "P60 — Instalación"
author: Guille Becerra O
created: 2026-10-19
version: 1.0
status: active
audience: cualquier persona que quiera usar P60 en un producto
language: es
---

# Instalación

**Prerequisitos:** `git`, `bash`, `python3`, `curl`, `tar` y [Claude Code](https://claude.com/claude-code). En macOS y Linux vienen casi todos; en Windows, usa Git Bash o WSL.

Instalar P60 tiene dos momentos:

1. **En tu computador, una vez:** deja disponible el comando `p60`.
2. **En cada producto:** `p60 init` convierte una carpeta en el context repo del producto.

## Opción A — Que Claude lo haga por ti

En una terminal, desde la carpeta del producto:

```bash
curl -fsSL https://raw.githubusercontent.com/guillebecerrao/p60/main/install.md | claude
```

O dentro de cualquier chat con Claude Code: *"Fetch https://raw.githubusercontent.com/guillebecerrao/p60/main/install.md and follow it."*

Claude revisa los prerequisitos, te pregunta si quieres instalarlo en el computador o solo en este proyecto, propone la carpeta, el idioma y la escala, te muestra el plan **antes** de escribir nada y espera tu aprobación. Nunca usa sudo ni edita los archivos de tu shell. Lo que escribe archivos es siempre el CLI, no el agente.

Es un camino nuevo y el resultado puede variar según el modelo: revisa lo que te propone. El camino manual (opción B) es la referencia.

## Opción B — Manual

**1. Instalar el comando** (una vez por computador):

```bash
curl -fsSL https://raw.githubusercontent.com/guillebecerrao/p60/main/install.sh | bash
```

Deja el framework en `~/.p60/versions/<versión>/` y el comando en `~/.local/bin/p60`. Sin sudo. Si `~/.local/bin` no está en tu PATH, el instalador te muestra la línea exacta para agregar a tu `~/.zshrc` o `~/.bashrc`.

Opciones: `--version v2.1.0` (una versión específica), `--prefix DIR` y `--bin-dir DIR` (otras carpetas).

**2. Verificar:**

```bash
p60 version
p60 doctor
```

**3. Preparar un producto:**

```bash
cd mi-producto          # una carpeta nueva o una que ya exista, con o sin git
p60 init --dry-run      # muestra el plan sin escribir
p60 init                # pregunta nombre, escala e idioma, y aplica
claude                  # ábrelo siempre desde esta carpeta
```

Primera frase para empezar: *"corre la fundación de contexto (fundacion-etapa-0)"*.

## Qué se crea en tu producto

```
mi-producto/
├── CLAUDE.md        ← si existía, solo se le agrega un bloque P60 (tu contenido queda igual)
├── .claude/         ← agentes, skills y el hook de guardarraíles (Claude Code los busca aquí)
└── p60/             ← todo lo demás
    ├── contexto/ shape/ ideate/ validate/ handoff-delivery/ experimentacion/ bitacora/ …
    └── _framework/  ← copia del framework (versión, constitución, agentes, templates); no se edita a mano
```

- **Autocontenido:** quien clone el repo lo tiene funcionando con solo Claude Code. No hay rutas a tu computador ni accesos directos.
- **No destructivo:** `init` no reemplaza archivos tuyos sin preguntar.
- **Git:** si la carpeta no tenía repo, lo crea con un commit que incluye solo lo que agregó P60. Si ya tenía, deja los cambios para que los revises.
- **Dentro de un codebase** (una landing, un prototipo): funciona, con una advertencia. Para productos que crecen o equipos que comparten contexto, conviene un repo separado.

## Actualizar

```bash
p60 self-update          # actualiza el comando en tu computador
p60 update --dry-run     # en cada producto: muestra qué cambiaría
p60 update               # aplica
```

`update` actualiza lo que no tocaste, te pregunta por lo que editaste (o deja la versión nueva al lado, como `.p60-new`), restaura lo que falte y nunca borra sin confirmación. No hace commit.

## Desinstalar

- **De un producto:** borra `p60/`, el bloque `<!-- P60:BEGIN … P60:END -->` del `CLAUDE.md` y, de `.claude/`, los agentes y skills de P60 (la lista exacta está en `p60/_framework/manifest.json`) más la entrada `gate-zonas` de `.claude/settings.json`. Hazlo antes de borrar `p60/`.
- **Del computador:** `rm -rf ~/.p60 ~/.local/bin/p60`.

## Problemas comunes

| Síntoma | Qué hacer |
|---------|-----------|
| `p60: command not found` | `~/.local/bin` no está en tu PATH: agrega la línea que mostró el instalador y abre una terminal nueva. |
| Claude no ve los agentes ni los skills | Abre Claude Code desde la raíz del producto (donde está `.claude/`), no desde `p60/`. `p60 doctor` lo detecta. |
| `init` se detiene con "hay colisiones" | Ya existen agentes o skills con esos nombres. Corre `p60 init` en una terminal para decidir, o `--overwrite` si quieres reemplazarlos. |
| El hook no pide confirmación en `activas/` | Corre `p60 doctor`; si el hook no está activo, `p60 update` lo repara. |

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 1.0 | 2026-10-19 | Claude Opus 5.5 (Product-Builder) | Creación: instalación agent-driven y manual, qué se crea, actualizar, desinstalar. |
