#!/usr/bin/env bash
# p60-lint — verificación de integridad del repo del framework P60 (y de context-repos que hereden su estructura).
# Vuelve ejecutables las reglas que la constitución declara: regla de sincronía spec↔componente,
# registro de skills en el índice, frontmatter completo y referencias no rotas.
#
# Uso: tools/p60-lint.sh [raíz del repo P60]   (default: el directorio padre de tools/)
# Salida: OK/WARN/FAIL por check. Exit 1 si hay FAIL, 0 si solo OK/WARN.
#
# Ámbito: este lint verifica el REPO DE CONTEXTO/FRAMEWORK (markdown). No verifica el repo de
# código — la interfaz con el codebase es pull-based (ver docs/adr/ADR-001).

set -u
ROOT="${1:-$(cd "$(dirname "$0")/.." && pwd)}"
cd "$ROOT" || { echo "FAIL  no existe la raíz: $ROOT"; exit 1; }

fails=0; warns=0
ok()   { echo "OK    $1"; }
warn() { echo "WARN  $1"; warns=$((warns+1)); }
fail() { echo "FAIL  $1"; fails=$((fails+1)); }

frontmatter_field() { # $1=file $2=field → imprime el valor o vacío
  awk -v f="$2" 'NR==1&&$0!="---"{exit} /^---$/{c++; next} c==1 && $0 ~ "^"f":" {sub("^"f":[[:space:]]*",""); print; exit}' "$1"
}

echo "── p60-lint · $(date +%Y-%m-%d) · raíz: $ROOT"

# 1. Skills: carpeta ↔ SKILL.md + spec + registro en _index.md
INDEX="skills/_index.md"
[ -f "$INDEX" ] || fail "no existe $INDEX"
for dir in skills/*/; do
  name=$(basename "$dir")
  [ "$name" = "_standards" ] && continue
  [ -f "$dir/SKILL.md" ] || { fail "skill '$name' sin SKILL.md"; continue; }
  [ -f "$dir/$name.spec.md" ] || fail "skill '$name' sin $name.spec.md (constitución #1)"
  grep -q "($name/SKILL.md)" "$INDEX" || fail "skill '$name' no registrado en $INDEX"
  # frontmatter obligatorio
  for field in name description version status triggers last_sync; do
    v=$(frontmatter_field "$dir/SKILL.md" "$field")
    [ -n "$v" ] || fail "skill '$name': frontmatter sin '$field'"
  done
  fmname=$(frontmatter_field "$dir/SKILL.md" "name")
  [ "$fmname" = "$name" ] || fail "skill '$name': frontmatter name='$fmname' ≠ carpeta"
done
# índice sin skills fantasma
grep -o '([a-z0-9-]*/SKILL.md)' "$INDEX" 2>/dev/null | tr -d '()' | while read -r ref; do
  [ -f "skills/$ref" ] || echo "FAIL  $INDEX referencia skills/$ref que no existe"
done | tee /tmp/p60lint_ghost$$ ; [ -s /tmp/p60lint_ghost$$ ] && fails=$((fails+$(wc -l </tmp/p60lint_ghost$$))); rm -f /tmp/p60lint_ghost$$
ok "skills: estructura, specs, frontmatter e índice revisados"

# 2. Agentes: canónico ↔ spec ↔ wrapper nativo
for f in agents/*.md; do
  name=$(basename "$f" .md)
  [ -f "agents/_specs/$name.spec.md" ] || fail "agente '$name' sin spec en agents/_specs/"
  [ -f ".claude/agents/$name.md" ] || warn "agente '$name' sin wrapper nativo en .claude/agents/"
done
for f in .claude/agents/*.md; do
  name=$(basename "$f" .md)
  [ -f "agents/$name.md" ] || fail "wrapper nativo '$name' sin prompt canónico en agents/"
done
ok "agentes: canónicos, specs y wrappers revisados"

# 2b. Tools: cada herramienta ↔ su spec en tools/_specs/ (constitución #1, tipo tool)
TOOLS="tools/p60:p60-cli tools/p60-lint.sh:p60-lint tools/hooks/gate-zonas.sh:gate-zonas"
for par in $TOOLS; do
  comp=${par%%:*}; spec="tools/_specs/${par##*:}.spec.md"
  [ -f "$comp" ] || continue
  [ -f "$spec" ] || fail "tool '$comp' sin spec en $spec"
done
ok "tools: specs revisadas"

# 3. Regla de sincronía: last_sync de la spec vs último commit del componente (si hay git)
if git rev-parse --git-dir >/dev/null 2>&1; then
  check_sync() { # $1=componente $2=spec
    [ -f "$1" ] && [ -f "$2" ] || return 0
    comp_date=$(git log -1 --format=%cs -- "$1" 2>/dev/null)
    spec_sync=$(frontmatter_field "$2" "last_sync")
    [ -n "$comp_date" ] && [ -n "$spec_sync" ] || return 0
    [ "$spec_sync" \< "$comp_date" ] && warn "deriva: $2 (last_sync=$spec_sync) más viejo que último commit de $1 ($comp_date)"
  }
  for dir in skills/*/; do
    name=$(basename "$dir"); [ "$name" = "_standards" ] && continue
    check_sync "$dir/SKILL.md" "$dir/$name.spec.md"
  done
  for f in agents/*.md; do
    name=$(basename "$f" .md)
    check_sync "$f" "agents/_specs/$name.spec.md"
  done
  for par in $TOOLS; do
    check_sync "${par%%:*}" "tools/_specs/${par##*:}.spec.md"
  done
  ok "regla de sincronía spec↔componente revisada (contra git)"
else
  warn "sin git: regla de sincronía no verificable"
fi

# 4. Referencias del CLAUDE.md y README (rutas mencionadas deben existir)
for ref in "docs/P60-Framework-Guide.md" "docs/arranque-rapido.md" ".p60/memory/constitution.md" \
           ".p60/registry/agents.yaml" "skills/_index.md" "templates" "_standards/component-spec.md" \
           "skills/_standards/SKILL-format.md" "tools/p60-lint.sh" "tools/p60" "tools/hooks/gate-zonas.sh" \
           ".claude/settings.json" "docs/adr" ".claude/agents" ".claude/skills"; do
  [ -e "$ref" ] || fail "CLAUDE.md/README referencia '$ref' y no existe"
done
ok "referencias de navegación revisadas"

echo "── resultado: $fails FAIL · $warns WARN"
[ "$fails" -gt 0 ] && exit 1
exit 0
