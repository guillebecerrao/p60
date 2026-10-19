---
name: generar-presentacion-html
description: Genera un HTML ejecutivo y visual (con gráficas y design system) a partir de un artefacto estratégico .md para comunicarlo a stakeholders.
version: 2.1
status: active
triggers: ["genera el html del ost", "quiero presentar el roadmap", "crea la presentación del backlog", "generar presentación html", "presentar artefacto a stakeholders"]
requires_context: ["el artefacto fuente .md", "p60/contexto/design-system/DS-input-v1/", "p60/presentaciones/_presentaciones-config.md", "p60/presentaciones/_sync-log.md"]
last_sync: 2026-10-19
---

# Generar Presentación HTML

> Convierte al agente en un experto en transformar un artefacto estratégico `.md` en un HTML ejecutivo, visual y comunicable a stakeholders, respetando design system, versionado (History) y multi-idioma.

## When to Use

Actívalo cuando el equipo necesite **comunicar un artefacto estratégico a stakeholders de forma visual y ejecutiva** — OST, roadmaps, backlog, épicas, release plan, análisis/sizing de oportunidades, o cualquier `.md` que el usuario indique (ver catálogo en `references/process-steps.md`).

**NO** lo uses para editar el HTML a mano (los HTML son artefactos **generados**; para actualizar, regenera desde el `.md`), ni para editar el contenido estratégico del `.md` fuente (eso es trabajo del skill/agente dueño de ese artefacto).

**Regla de oro:** el agente **siempre pregunta antes de generar**, incluso si el `.md` acaba de editarse — el usuario puede tener cambios pendientes antes de una versión comunicable.

## Procedure

Protocolo de 8 pasos. **Detalle completo de cada paso en `references/process-steps.md`.**

0. **Chequeo de sync-log** — leer `p60/presentaciones/_sync-log.md`; alertar (sin bloquear) si hay 3+ pendientes o alguna con +2 semanas. Ver `references/config-and-history.md`.
1. **Confirmar con el usuario** que la versión del `.md` está lista para presentar.
2. **Leer el design system** (`DS-input-v1/tokens.md`, `components.md`, `brand.md`).
3. **Leer la config** (`_presentaciones-config.md`): guías visuales del artefacto, documentos permanentes y `estado_idiomas`. Ver `references/config-and-history.md`.
4. **Verificar versión existente y gestionar History** — si ya hay HTML del mismo artefacto (por nombre-base), preguntar archivar/descartar + pausa de traducciones. Ver `references/config-and-history.md`.
5. **Leer el artefacto fuente** `.md` completo.
6. **Generar el HTML** según `estado_idiomas`: rama single-language o multi-language (ES/EN/PT embebidos). Arquitectura multi-idioma completa en `references/multi-language.md`.
7. **Guardar en `p60/presentaciones/`** con el naming según categoría (referencia / ciclo / cross-ciclo). Ver `references/config-and-history.md`.
8. **Evaluar y registrar en sync-log** si hubo un cambio **transversal** al patrón. Ver `references/config-and-history.md`.

> **OST — comportamiento especial:** renderizar el árbol **completo**; destacar `on_selected_path: true` (ruta) y `selected: true` (hoja elegida), resto en visual secundario. Detalle en `references/process-steps.md`.

## Pitfalls

- **Generar sin confirmar** → siempre preguntar en el Paso 1, aunque el `.md` esté recién editado.
- **Editar un HTML a mano** → nunca; son generados. Regenerar desde el `.md`.
- **Identificar el "mismo artefacto" por la fecha del nombre de archivo** → se identifica por el **nombre-base** (`ost`, `como-trabajamos`), no por la fecha.
- **Saltarse la lectura de la config** → se pierden guías visuales registradas y el `estado_idiomas`; si no está registrado, asumir `single_language`.
- **Registrar cambios NO transversales en el sync-log** (guías de un artefacto, nuevos docs, cambio de idioma de un artefacto) → no se registran; solo lo que afecta la arquitectura base compartida.
- **Ruta del design system hardcodeada** → si la carpeta cambia de versión, buscar el `README.md` más reciente en `p60/contexto/design-system/`.

## Verification

- [ ] El usuario confirmó explícitamente que el `.md` está listo (Paso 1).
- [ ] HTML aplica design system (tokens, componentes, marca) y guías visuales de la config.
- [ ] Incluye título, fecha (`YYYY-MM-DD`), nav a `home.html` (si existe) y footer con "Documentos relacionados".
- [ ] Si `multi_language_enabled`: tres idiomas embebidos, auto-detección + switcher ES|EN|PT, y advertencia de revisar términos de dominio.
- [ ] Guardado en `p60/presentaciones/` con naming correcto; History gestionado si había versión previa.
- [ ] OST (si aplica): árbol completo, ruta y hoja elegida destacadas.
- [ ] Cambio transversal (si lo hubo) registrado en `_sync-log.md` como `Propagado: ❌ No`.
