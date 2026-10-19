# p60

> P60 (*AI-Native Spec-Driven Product Building*) convierte una carpeta en el sistema operativo de producto de un equipo: discovery, specs, evidencia y decisiones, operado con agentes de IA. Este archivo instala P60 y lo prepara en el proyecto del usuario.

Quiero que instales P60 y prepares mi proyecto. Sigue los pasos en orden y detente donde un paso te diga que te detengas. Habla conmigo en mi idioma (el de esta conversación o el de mi sistema); los comandos y nombres de carpetas no se traducen.

OBJETIVO: dejar P60 instalado (en el computador o solo para este proyecto) e instanciado en la carpeta del producto que el usuario confirme.

LISTO CUANDO:

- `p60 init` terminó sin errores en la carpeta confirmada y existe `<carpeta>/p60/_framework/VERSION`
- el usuario vio el plan antes de que se escribiera nada y lo aprobó
- el usuario sabe cómo abrir Claude Code en esa carpeta y con qué frase empezar

TODO:

- [ ] Revisar prerequisitos
- [ ] Elegir el modo: instalación global o solo este proyecto
- [ ] Instalar (con confirmación del usuario)
- [ ] Confirmar la carpeta del producto, el idioma y la escala
- [ ] Mostrar el plan de `p60 init --dry-run` y esperar aprobación
- [ ] Ejecutar `p60 init` y reportar lo que realmente imprimió

## 1. Prerequisitos

Revisa que existan `git`, `bash`, `python3`, `curl` y `tar` (`command -v` de cada uno). Claude Code ya lo tienes: estás corriendo en él. Si falta algo, di cuál y cómo conseguirlo en el sistema del usuario (por ejemplo, en macOS `xcode-select --install` trae git; python3 viene de python.org o del gestor que ya use), y detente. No instales prerequisitos tú.

En Windows, P60 necesita bash: Git Bash (viene con Git for Windows) o WSL. Si no estás en ninguno de los dos, dilo y detente.

## 2. Modo de instalación

Ofrece los dos modos y recomienda uno con tu mejor inferencia, no con una pregunta abierta:

- **Global** (recomendado si va a usar P60 en más de un producto o quiere actualizarlo fácil): deja el comando `p60` en el computador, en `~/.p60` y `~/.local/bin`, sin sudo.
- **Solo este proyecto**: descarga P60 a una carpeta temporal, prepara el proyecto y borra la descarga. El proyecto queda completo igual; para actualizarlo más adelante hará falta la instalación global.

## 3. Instalar

**Global.** Corre primero `p60 version`. Si ya imprime una versión, P60 está instalado: dilo, ofrece actualizarlo con `p60 self-update` y, si no quiere, pasa al paso 4. Si no está, muestra este comando y pide confirmación antes de correrlo (instala software fuera del proyecto):

```bash
curl -fsSL https://raw.githubusercontent.com/guillebecerrao/p60/main/install.sh | bash
```

Relaya lo que imprima. Si dice que `~/.local/bin` no está en el PATH, muestra la línea que propone y deja que el usuario la agregue: **nunca edites archivos de shell** (`.zshrc`, `.bashrc`, `.profile`, perfiles de fish o PowerShell). Para esta sesión, usa la ruta completa `~/.local/bin/p60`. Si el instalador pide permisos que no tiene, detente y pregunta: no uses sudo.

**Solo este proyecto.** Muestra estos comandos, pide confirmación y córrelos:

```bash
P60_TAG=$(curl -fsSLI -o /dev/null -w '%{url_effective}' https://github.com/guillebecerrao/p60/releases/latest | sed -n 's#.*/tag/##p')
P60_TMP=$(mktemp -d)
curl -fsSL "https://github.com/guillebecerrao/p60/archive/refs/tags/$P60_TAG.tar.gz" | tar -xz -C "$P60_TMP" --strip-components=1
```

En los pasos siguientes, `p60` es `"$P60_TMP/tools/p60"`. Al terminar el paso 6, borra `"$P60_TMP"`.

## 4. Carpeta, idioma y escala

**Carpeta.** La carpeta donde corre `p60 init` se convierte en el context repo del producto: todo P60 queda en `<carpeta>/p60/`, y afuera solo `.claude/` y un bloque en el `CLAUDE.md` de la raíz. Propón tu mejor inferencia (normalmente la raíz git del proyecto actual) y nómbrala: "estás en ~/code/acme, lo preparo ahí". Si la carpeta es el home, `/`, una carpeta temporal o algo que no parece un producto, detente y pregunta dónde va. Si el usuario quiere una carpeta nueva, `p60 init <ruta>` la crea.

**Idioma** del contenido: `es`, `en` o `pt` (portugués de Brasil). Infiérelo de la conversación.

**Escala** del equipo: `pb` (una persona, Product Builder), `triada` (PM + diseño + ingeniería) o `squad`. Explica la diferencia en una línea; si no hay pistas, propone `pb`. Solo cambia el rigor de ramas y ceremonias, no la estructura.

Confirma las tres cosas en una sola pregunta.

## 5. Plan (puerta humana)

Corre el plan sin escribir nada:

```bash
p60 init <carpeta> --lang <es|en|pt> --escala <pb|triada|squad> --dry-run
```

Muéstrale al usuario el plan tal como lo imprimió, y destaca:

- **Colisiones** (`Ya existe (se reemplazaría)`): agentes, skills o una carpeta `p60/` que ya existen. Explica que `init` los reemplazaría y pregunta explícitamente si los reemplaza. Sin un sí explícito, detente.
- **Advertencia de código** (`Esto parece un repositorio de código`): P60 funciona dentro de un codebase porque todo queda en `p60/`, pero para un producto que va a crecer o un equipo que comparte contexto conviene un repo separado. Repite la sugerencia y deja que el usuario decida.
- **Git**: si la carpeta no tenía git, `init` lo inicializa con un commit que incluye solo lo que crea P60. Si ya tenía, deja los cambios sin commitear.

Espera la aprobación del plan.

## 6. Ejecutar

Corre el mismo comando sin `--dry-run` y con `--yes`. Agrega `--overwrite` solo si el usuario aprobó explícitamente reemplazar las colisiones del paso 5.

```bash
p60 init <carpeta> --lang <…> --escala <…> --yes
```

No escribas ni muevas archivos a mano: todo lo que se crea lo crea `p60 init`. Si falla, relaya el error y lo que sugiere, en vez de improvisar.

## 7. Reportar

Relaya lo que `init` imprimió de verdad, sin suponer: dónde quedó, versión instalada y si hubo commit. Luego explica el siguiente paso:

1. Los agentes, skills y guardarraíles de P60 se cargan al abrir Claude Code **en esa carpeta**. Si la sesión actual no está abierta ahí, el usuario debe salir y correr `cd <carpeta> && claude`.
2. Primera frase para empezar: *"corre la fundación de contexto (fundacion-etapa-0)"*. Es una entrevista guiada sobre negocio, mercado, equipo y dominio.
3. Para mantenerlo al día: `p60 update` (muestra qué cambia antes de aplicar y no pisa lo que el equipo editó).

EJECUTA AHORA: completa el TODO de arriba para lograr: P60 instalado, el proyecto preparado con un plan aprobado por el usuario, y el usuario sabiendo cómo empezar.

Más contexto: https://github.com/guillebecerrao/p60 · guía de instalación: `docs/instalacion.md`
