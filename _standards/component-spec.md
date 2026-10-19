# Estándar — `.spec.md` de componente

> **Regla constitucional #1:** ningún componente de P60 (agente, skill, template, tool) existe sin su `.spec.md`. La spec es la fuente de verdad; el componente es su consecuencia.

## Dónde vive

| Componente | Spec |
|-----------|------|
| Agente `agents/[nombre].md` | `agents/_specs/[nombre].spec.md` |
| Skill `skills/[nombre]/SKILL.md` | `skills/[nombre]/[nombre].spec.md` |
| Template `templates/.../[nombre]` | `templates/_specs/[nombre].spec.md` |
| Tool `tools/[nombre]` (CLI, scripts, hooks) | `tools/_specs/[nombre].spec.md` |

> *Nota histórica:* el tipo `procedure` (protocolos multi-paso determinísticos) existió en el origen del framework, antes de que existieran los skills. Todo su contenido migró a `skills/`; los pasos determinísticos de un protocolo viven hoy dentro del `Procedure` del skill correspondiente o en scripts de `tools/`.

## Frontmatter obligatorio

```yaml
---
component: [nombre]                 # identificador kebab-case
type: agent | skill | template | tool
version: MAJOR.MINOR                # minor = ajuste; major = reestructuración
status: draft | active | deprecated
agent_role: architect | developer | reviewer   # quién es dueño del ciclo de esta spec
last_sync: YYYY-MM-DD               # última vez que spec y componente se verificaron alineados
depends_on: [otros-componentes]     # opcional
---
```

## Cuerpo obligatorio

```markdown
# [Nombre] — Spec

## Propósito
Una frase: qué problema resuelve este componente y por qué existe.

## Contrato
Qué garantiza el componente. Inputs esperados, outputs producidos, invariantes.

## Criterios de aceptación
- [ ] Verificable 1
- [ ] Verificable 2

## Decisiones (ADR inline)
Trade-offs no obvios: alternativas consideradas, criterio de decisión, por qué la elegida.

## Changelog
| Version | Date | Author | Description |
```

## Regla de sincronía
Al modificar el componente: actualizar `version`, `last_sync` y el changelog de su spec **en el mismo commit**. Una spec cuyo `last_sync` es más viejo que el componente es una alerta de deriva.
