---
component: bibliotecario-evidencia
type: skill
version: 1.0
status: active
agent_role: architect
last_sync: 2026-07-13
depends_on: [SKILL-format, constitution]
---

# Bibliotecario de Evidencia — Spec

## Propósito
Dar mecanismo al principio constitucional "ninguna spec sin evidencia": todo material que entra al context-repo se cataloga con una ficha `EV-NNN` referenciable y buscable, sin que investigar contexto interno exija leer archivos grandes.

## Contrato
- **Input:** archivos en `contexto/evidencia/_inbox/` (cualquier formato de material bruto), o una consulta de búsqueda de evidencia.
- **Output:** ficha `EV-NNN` por archivo + original archivado en su destino por tipo + `_index.md` actualizado. En búsqueda: las fichas relevantes (y solo si confirman, el original).
- **Invariantes:** el `_inbox` queda vacío tras cada corrida; las siglas son únicas y no se reutilizan; los artefactos citan siglas, nunca rutas; la ficha cabe en ~1 página.

## Criterios de aceptación
- [ ] `SKILL.md` lean con las 4 secciones obligatorias; template de ficha en `templates/`.
- [ ] Flujo bibliotecario completo: inventariar → identificar → sigla → ficha → archivar → indexar.
- [ ] Protocolo de búsqueda índice → ficha → original (nunca al revés).
- [ ] Registrado en `skills/_index.md`.

## Decisiones (ADR inline)
- **Ficha como subrogante, no como copia:** el valor es de-referenciación barata (leer 1 página en vez de 40). Alternativa descartada: embeddings/búsqueda semántica — innecesaria a la escala de un context-repo y rompe la legibilidad humana del sistema.
- **Sigla estable > ruta:** los originales se mueven al madurar el repo (ubicación=estado); la sigla `EV-NNN` es el identificador que sobrevive a los movimientos. Patrón bibliotecario clásico (catálogo/estantería).
- **Destino del original por tipo** (no todo bajo `evidencia/`): el original alimenta la carpeta de contexto donde naturalmente se buscaría (analytics en mercado-usuario, transcripciones en shape); la ficha mantiene la trazabilidad transversal.

## Changelog
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 1.0 | 2026-07-13 | Claude Fable 5 (Product-Builder) | Creación. Cubre el gap H5 del análisis de mejoras (pasada Fable 5), según el diseño "bibliotecario" definido por Guillermo: inbox → ficha EV-NNN → archivado → índice buscable. |
