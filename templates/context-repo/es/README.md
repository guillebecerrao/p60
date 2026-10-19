# Template — Context Repo P60 (es)

> Estructura canónica del **context repo** de un producto. `p60 init` la clona y la puebla.
> Autocontenido y separado del código. El método completo: `docs/P60-Framework-Guide.md`.

```
[producto]-context/
├── CLAUDE.md                       # navegación del context repo
├── framework.md                    # puntero a la constitución P60
│
├── contexto/                       # ── Etapa 0: Fundación + contexto vivo ──
│   ├── negocio/                    # modelo de negocio, estrategia, objetivos c/m/l plazo
│   ├── mercado-usuario/            # contexto de mercado + usuario temprano (entrevistas, early adopters)
│   ├── equipo/                     # estructura org, squad, roles, modelo de trabajo
│   ├── dominio/                    # glosario, design-system semilla, tech-stack + ADRs
│   ├── estrategia/                 # ost.md (fuente única), evidencia-validada, backlog, roadmaps
│   └── evidencia/                  # sistema de evidencia — patrón bibliotecario
│       ├── _inbox/                 # entrada: se deja aquí el material bruto
│       ├── _index.md               # catálogo: una fila por ficha (primera parada de toda búsqueda)
│       ├── fichas/                 # EV-NNN-[slug].md — subrogantes livianos de los originales
│       └── originales/             # originales sin destino natural en otra carpeta de contexto
│
├── shape/                          # ── Sub-proceso 1 ── discovery + priorización
├── ideate/                         # ── Sub-proceso 2 ── generación de ideas de solución
├── validate/                       # ── Sub-proceso 3 ── PRD-brief + prototipo baja-fi + validación
│
├── handoff-delivery/               # ── Sub-proceso 4 ──
│   └── epicas/[epica]/
│       ├── prd-maestro.md          # PRD Maestro (épica, vivo)
│       └── features/[feature]/
│           ├── prd-[feature].md    # PRD de feature validado + ADR + prototipo alta-fi
│           ├── activas/            # Iteration PRD en sprint (congelado)
│           └── cerradas/           # implementado (respaldo-como-contexto)
│
├── experimentacion/                # ── Sub-proceso 6 ── validación post-build (Build = 5, en código)
│   └── pipeline.md
│
├── bitacora/                       # memoria: agéntica + humana (buscable)
├── presentaciones/                 # HTML ejecutivo para stakeholders
└── _historia/ · legacy/            # respaldo (NO leer por defecto)
```

> **Sistema de evidencia (bibliotecario).** Todo material bruto entra por `_inbox/`; el skill `bibliotecario-evidencia` lo identifica, crea su ficha `EV-NNN` (resumen + hallazgos + dónde está cada cosa), archiva el original en su carpeta de destino y actualiza `_index.md`. Investigar contexto interno = leer índice → fichas → recién entonces el original. Los artefactos (PRDs, OST) citan la sigla `[EV-NNN]`, nunca rutas.
>
> **Notas de la evolución v2 respecto del template de referencia:**
> - **Ideate y Validate** ahora son sub-procesos separados (antes "ideate-validate").
> - **Etapa 0** explícita: `contexto/negocio/` + `contexto/mercado-usuario/` como evidencia fundante.
> - **handoff-delivery** reorganizado por `epicas/[epica]/features/[feature]/` con el PRD Maestro gobernando.
> - **Ubicación = estado:** `validate/…` (libre) → `activas/` (congelado) → `cerradas/` (respaldo).
>
> *Esqueleto ES-first. El contenido de cada carpeta (índices de contexto, retros, _schema) se puebla en la migración de templates.*
