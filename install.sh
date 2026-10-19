#!/usr/bin/env bash
# install.sh — instala el CLI de P60 en este computador (sin sudo).
# Contrato: tools/_specs/p60-cli.spec.md (sección "Instalación global").
#
#   curl -fsSL https://raw.githubusercontent.com/guillebecerrao/p60/main/install.sh | bash
#   curl -fsSL …/install.sh | bash -s -- --version v2.1.0
#
# Opciones:
#   --version vX.Y.Z   versión a instalar (default: el último release)
#   --prefix DIR       dónde guardar el framework (default: ~/.p60)
#   --bin-dir DIR      dónde dejar el comando p60 (default: ~/.local/bin)
#   --tarball RUTA     instalar desde un .tar.gz local (pruebas sin red)
#
# Qué hace: baja el release, lo deja en PREFIX/versions/<versión>/, apunta PREFIX/current
# a esa versión y crea BIN-DIR/p60. No usa sudo, no edita archivos de tu shell y no toca
# ningún proyecto: para instalar P60 en un producto, después corre `p60 init`.

set -euo pipefail
REPO="guillebecerrao/p60"
VERSION="" PREFIX="$HOME/.p60" BIN_DIR="$HOME/.local/bin" TARBALL=""

case "${LANG:-}" in en*) L=en;; pt*) L=pt;; *) L=es;; esac
t() { # mensajes es/en/pt
  case "$L:$1" in
    en:need)    echo "missing required command: $2";;
    pt:need)    echo "falta o comando necessário: $2";;
    *:need)     echo "falta un comando necesario: $2";;
    en:nover)   echo "couldn't find the latest release. Retry with --version vX.Y.Z";;
    pt:nover)   echo "não encontrei o último release. Tente de novo com --version vX.Y.Z";;
    *:nover)    echo "no encontré el último release. Reintenta con --version vX.Y.Z";;
    en:get)     echo "Downloading P60 $2…";;
    pt:get)     echo "Baixando o P60 $2…";;
    *:get)      echo "Descargando P60 $2…";;
    en:bad)     echo "the download doesn't look like P60 (tools/p60 missing). Nothing was installed.";;
    pt:bad)     echo "o download não parece ser o P60 (falta tools/p60). Nada foi instalado.";;
    *:bad)      echo "lo descargado no parece P60 (falta tools/p60). No se instaló nada.";;
    en:nowrite) echo "I can't write to $2. I won't use sudo: choose another folder with --bin-dir or --prefix.";;
    pt:nowrite) echo "Não consigo escrever em $2. Não vou usar sudo: escolha outra pasta com --bin-dir ou --prefix.";;
    *:nowrite)  echo "No puedo escribir en $2. No voy a usar sudo: elige otra carpeta con --bin-dir o --prefix.";;
    en:ok)      echo "✓ P60 $2 installed: $3";;
    pt:ok)      echo "✓ P60 $2 instalado: $3";;
    *:ok)       echo "✓ P60 $2 instalado: $3";;
    en:path)    printf '%s\n' "$2 is not in your PATH. Add this line to your shell profile (~/.zshrc or ~/.bashrc) and open a new terminal:" "    export PATH=\"$2:\$PATH\"";;
    pt:path)    printf '%s\n' "$2 não está no seu PATH. Adicione esta linha ao perfil do seu shell (~/.zshrc ou ~/.bashrc) e abra um terminal novo:" "    export PATH=\"$2:\$PATH\"";;
    *:path)     printf '%s\n' "$2 no está en tu PATH. Agrega esta línea al perfil de tu shell (~/.zshrc o ~/.bashrc) y abre una terminal nueva:" "    export PATH=\"$2:\$PATH\"";;
    en:shadow)  echo "Warning: another p60 comes first in your PATH ($2). Remove it or put $3 before it.";;
    pt:shadow)  echo "Atenção: outro p60 vem antes no seu PATH ($2). Remova-o ou coloque $3 antes.";;
    *:shadow)   echo "Ojo: hay otro p60 antes en tu PATH ($2). Quítalo o pon $3 antes.";;
    en:next)    echo "Next: go to your product folder and run  p60 init";;
    pt:next)    echo "Próximo passo: vá até a pasta do produto e rode  p60 init";;
    *:next)     echo "Siguiente: entra a la carpeta de tu producto y corre  p60 init";;
    en:next_up) echo "Updated from $2. Next: in each product folder, run  p60 update";;
    pt:next_up) echo "Atualizado de $2. Próximo passo: em cada pasta de produto, rode  p60 update";;
    *:next_up)  echo "Actualizado desde $2. Siguiente: en la carpeta de cada producto, corre  p60 update";;
  esac
}
die() { printf 'p60 install: %s\n' "$*" >&2; exit 1; }

while [ $# -gt 0 ]; do
  case "$1" in
    --version) VERSION="$2"; shift 2;;
    --prefix)  PREFIX="$2"; shift 2;;
    --bin-dir) BIN_DIR="$2"; shift 2;;
    --tarball) TARBALL="$2"; shift 2;;
    *) die "opción desconocida: $1";;
  esac
done

for c in bash tar git python3; do command -v "$c" >/dev/null || die "$(t need "$c")"; done
[ -n "$TARBALL" ] || command -v curl >/dev/null || die "$(t need curl)"

# Versión: la pedida, o la del último release (redirección de GitHub, sin API)
if [ -z "$TARBALL" ] && [ -z "$VERSION" ]; then
  VERSION=$(curl -fsSLI -o /dev/null -w '%{url_effective}' "https://github.com/$REPO/releases/latest" | sed -n 's#.*/tag/##p')
  [ -n "$VERSION" ] || die "$(t nover)"
fi
case "$VERSION" in ""|v*) ;; *) VERSION="v$VERSION";; esac

for d in "$PREFIX" "$BIN_DIR"; do
  mkdir -p "$d" 2>/dev/null && [ -w "$d" ] || die "$(t nowrite "$d")"
done

tmp=$(mktemp -d "${TMPDIR:-/tmp}/p60-install.XXXXXX")
trap "rm -rf '$tmp'" EXIT
if [ -n "$TARBALL" ]; then
  cp "$TARBALL" "$tmp/p60.tar.gz"
else
  echo "$(t get "$VERSION")"
  curl -fsSL "https://github.com/$REPO/archive/refs/tags/$VERSION.tar.gz" -o "$tmp/p60.tar.gz"
fi
mkdir "$tmp/src" && tar -xzf "$tmp/p60.tar.gz" -C "$tmp/src" --strip-components=1
[ -x "$tmp/src/tools/p60" ] || die "$(t bad)"
ver=$(cat "$tmp/src/VERSION" 2>/dev/null || echo "${VERSION#v}")

# Instalar: versions/<ver> + current + bin/p60 (reemplazos atómicos dentro de PREFIX)
previa=$(readlink "$PREFIX/current" 2>/dev/null | sed 's#^versions/##' || true)
rm -rf "$PREFIX/versions/$ver"; mkdir -p "$PREFIX/versions"
mv "$tmp/src" "$PREFIX/versions/$ver"
ln -sfn "versions/$ver" "$PREFIX/current"
ln -sfn "$PREFIX/current/tools/p60" "$BIN_DIR/p60"

echo "$(t ok "$ver" "$BIN_DIR/p60")"
case ":$PATH:" in
  *":$BIN_DIR:"*)
    otro=$(command -v p60 || true)
    [ -n "$otro" ] && [ "$otro" != "$BIN_DIR/p60" ] && echo "$(t shadow "$otro" "$BIN_DIR")"
    ;;
  *) t path "$BIN_DIR";;
esac
if [ -n "$previa" ] && [ "$previa" != "$ver" ]; then echo "$(t next_up "$previa")"; else echo "$(t next)"; fi
