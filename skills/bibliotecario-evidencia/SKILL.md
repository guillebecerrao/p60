---
name: bibliotecario-evidencia
description: Procesa el _inbox de evidencia como un bibliotecario — identifica cada archivo, crea su ficha EV-NNN, archiva el original donde corresponde y mantiene el índice de fichas buscable.
version: 1.0
status: active
triggers: ["procesar el inbox", "archivar evidencia", "ficha de evidencia", "catalogar evidencia", "dejé algo en el inbox", "qué evidencia tenemos", "buscar evidencia"]
requires_context: ["contexto/evidencia/_inbox/", "contexto/evidencia/_index.md"]
last_sync: 2026-07-13
---

# Bibliotecario de Evidencia

> Convierte al agente en el bibliotecario del context-repo: todo lo que entra por `_inbox/` sale catalogado con una ficha `EV-NNN` referenciable, y el original queda archivado donde corresponde.

## When to Use

Actívalo cuando: hay **archivos nuevos en `contexto/evidencia/_inbox/`** (transcripciones, exports de analytics, informes de mercado, notas, PDFs), el usuario pide **catalogar o archivar evidencia**, o se necesita **buscar qué evidencia existe** sobre un tema (se busca en fichas, nunca leyendo los originales).

**NO** lo uses para: sintetizar una entrevista en snapshot (eso es `interview-snapshot` — el snapshot resultante SÍ pasa por aquí para su ficha), ni para actualizar el OST con hallazgos (eso es `ost-facilitator`).

## Procedure

1. **Inventariar el `_inbox/`.** Lista los archivos pendientes. Si está vacío y la tarea es búsqueda, salta al paso 6.
2. **Identificar cada archivo.** Léelo (o su inicio, si es muy grande) y determina: tipo de evidencia, tema, fecha de origen, fuente. Tipos: `entrevista` · `analytics` · `mercado` · `negocio` · `test` (resultado de test/experimento) · `feedback` · `otro`.
3. **Asignar la sigla.** Siguiente correlativo `EV-NNN` según `_index.md` (tres dígitos, no se reutilizan siglas — ni siquiera de evidencia descartada).
4. **Crear la ficha** en `contexto/evidencia/fichas/EV-NNN-[slug].md` con el template `templates/ficha-evidencia.md`. La ficha es el **subrogante liviano del original**: debe permitir decidir *sin abrir el original* si contiene lo que se busca — resumen, hallazgos clave con ubicación interna (sección/minuto/página), y ruta al original.
5. **Archivar el original.** Muévelo a su destino según tipo (tabla abajo) y registra la ruta final en la ficha. Presenta el plan de movimientos antes de mover (puerta humana).
   | Tipo | Destino del original |
   |------|---------------------|
   | entrevista (transcripción) | `shape/entrevistas/transcripciones/` |
   | analytics / datos de uso | `contexto/mercado-usuario/analytics/` |
   | mercado / competencia | `contexto/mercado-usuario/mercado/` |
   | negocio / estrategia | `contexto/negocio/` |
   | test / experimento | `experimentacion/resultados/` |
   | feedback / otro | `contexto/evidencia/originales/` |
6. **Actualizar `_index.md`**: una fila por ficha (sigla, tipo, tema en una línea, fecha, confianza, ruta de ficha). El índice es el primer y a menudo único archivo que se lee al investigar contexto interno.
7. **Búsqueda (cuando la tarea es investigar):** lee `_index.md` → abre solo las fichas candidatas → solo si la ficha confirma relevancia, abre el original. Nunca al revés.

## Pitfalls

- **Leer originales para buscar.** El costo que este skill elimina. → Índice → ficha → recién entonces original.
- **Ficha = copia del contenido.** La ficha resume y ubica; no duplica. Si supera ~1 página, está mal.
- **Referenciar rutas en vez de siglas.** Los artefactos (PRDs, OST) citan `[EV-NNN]`, nunca rutas — las rutas cambian al archivar; la sigla es estable.
- **Dejar el original en `_inbox/`.** Un inbox que acumula es un inbox muerto. Cada corrida lo deja vacío.
- **Inventar confianza.** El nivel de confianza sale de la fuente y el método (¿n=1 o n=12? ¿dato o anécdota?), no del entusiasmo.

## Verification

- [ ] `_inbox/` queda vacío tras la corrida.
- [ ] Cada ficha tiene sigla única, tipo, resumen, hallazgos con ubicación interna y ruta del original archivado.
- [ ] `_index.md` actualizado — una fila por ficha nueva.
- [ ] Los movimientos de archivos fueron presentados y confirmados antes de ejecutarse.
- [ ] Ninguna sigla reutilizada; correlativo respetado.
