#!/usr/bin/env bash
# gate-zonas — hook PreToolUse de P60 (puerta humana ejecutable).
# Implementa la regla constitucional 2 (puerta calibrada por contrato de mutabilidad) y el
# escaneo del doble-gate (regla 10): las escrituras sobre zonas congeladas/protegidas no se
# bloquean — se ESCALAN AL HUMANO ("ask"), que es exactamente lo que la constitución pide.
#
# Se registra en .claude/settings.json → hooks.PreToolUse (matcher Write|Edit).
# Zonas libres: exit 0 silencioso (sin fricción). Zonas protegidas: permissionDecision=ask.

set -u
INPUT=$(cat)

python3 - "$INPUT" <<'EOF'
import json, re, sys

try:
    data = json.loads(sys.argv[1])
except Exception:
    sys.exit(0)  # ante duda, no interferir

tool_input = data.get("tool_input", {}) or {}
path = tool_input.get("file_path", "") or ""
content = (tool_input.get("content", "") or "") + (tool_input.get("new_string", "") or "")

def ask(reason: str):
    print(json.dumps({
        "hookSpecificOutput": {
            "hookEventName": "PreToolUse",
            "permissionDecision": "ask",
            "permissionDecisionReason": reason,
        }
    }))
    sys.exit(0)

# 1) Zonas por contrato de mutabilidad (constitución, regla 2)
# Las zonas viven en p60/ (o en .p60/ del repo del framework): se evalúan sobre la ruta
# relativa al proyecto, para no escalar carpetas homónimas del código (p. ej. src/legacy/).
import os
proyecto = os.environ.get("CLAUDE_PROJECT_DIR") or data.get("cwd") or ""
abs_path = os.path.realpath(path) if path else ""
raiz = os.path.realpath(proyecto) if proyecto else ""
if raiz and (abs_path == raiz or abs_path.startswith(raiz + os.sep)):
    rel, ancla = "/" + os.path.relpath(abs_path, raiz), "^"
else:
    rel, ancla = path, ""  # fuera del proyecto: se mantiene la detección sin anclar
PROTEGIDAS = [
    (r"/p60/(.*/)?activas/",   "Zona CONGELADA (activas/): el doc está en ventana de sprint. Modificarlo exige comunicarlo a quien construye."),
    (r"/p60/(.*/)?cerradas/",  "Zona RESPALDO (cerradas/): inmutable — es contexto histórico, no se edita."),
    (r"/p60/(.*/)?_historia/", "Zona RESPALDO (_historia/): inmutable — es contexto histórico, no se edita."),
    (r"/(\.p60|p60/_framework)/memory/", "Memoria del framework (constitución): cambia poco y nunca a mitad de sesión. Confirmar explícitamente."),
    (r"/p60/_framework/",      "Zona GESTIONADA (p60/_framework/): la reemplaza `p60 update`. Las adaptaciones locales van en p60/framework.md."),
    (r"/p60/legacy/",          "Zona legacy: no se toca por defecto."),
]
for patron, razon in PROTEGIDAS:
    if re.search(ancla + patron, rel):
        ask(f"[P60 · puerta humana] {razon}")

# 2) Escaneo de patrones peligrosos al escribir memoria/skills/specs (doble-gate, regla 10)
if re.search(r"(CLAUDE\.md|SKILL\.md|\.spec\.md|bitacora)", path):
    SOSPECHOSOS = [
        r"ignor(a|e)\s+(las\s+)?instruccion", r"ignore\s+(all\s+)?previous\s+instructions",
        r"<\s*system[\s>]", r"do\s+not\s+tell\s+the\s+user", r"exfiltr",
        r"curl\s+.*\|\s*(ba)?sh", r"rm\s+-rf\s+[/~]",
    ]
    for s in SOSPECHOSOS:
        if re.search(s, content, re.IGNORECASE):
            ask("[P60 · doble-gate] El contenido a escribir en memoria/skill/spec matchea un patrón "
                f"sospechoso de inyección ({s}). Revisar antes de aprobar.")

sys.exit(0)
EOF
