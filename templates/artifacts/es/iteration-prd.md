---
type: iteration-prd
level: 3
scope: sprint
status: draft           # draft | in_review | approved | in_dev | validated
epica: [epica-slug]
feature: [feature-slug]
prd_feature: [ruta al PRD de feature]
iteracion: NN
created: YYYY-MM-DD
last_modified: YYYY-MM-DD
---

# Iteration PRD [NN] — [Feature] · [Alcance del sprint]

> **Nivel 3.** Input ejecutable para un sprint. Scope acotado, **sin preguntas abiertas** (o ADR explícito como placeholder). Listo para el dev team o para Speckit.
> **Ubicación = estado:** `activas/` mientras está en ventana de sprint (**congelado** en `in_dev` — no modificar sin comunicar) → `cerradas/` una vez implementado (**respaldo-como-contexto**).

## Trazabilidad
PRD de feature: [link] · Épica: [link] · Oportunidad OST: [nodo].

## User stories + criterios de aceptación (Gherkin)
### US-1 — [título]
Como [rol] quiero [acción] para [beneficio].
```gherkin
Escenario: [nombre]
  Dado [contexto]
  Cuando [acción]
  Entonces [resultado esperado]
```

## Requerimientos técnicos
Resueltos aquí, o **ADR placeholder** explícito cuando la decisión depende de un tercero (no bloquea el resto del sprint).

## Work items por stream
| Stream | Work item | Dependencia |
|--------|-----------|-------------|
| frontend / backend / … | | |

## Casos de borde
- [Caso de borde 1 → comportamiento esperado]

## Definición de terminado
- [ ] AC cumplidos · [ ] casos de borde cubiertos · [ ] revisado por la tríada → `approved`

## Changelog
| Version | Date | Author | Description |
