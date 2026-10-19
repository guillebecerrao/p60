---
name: fundacion-etapa-0
description: Conduce la Etapa 0 de un producto recién instanciado — entrevista guiada de fundación (negocio, mercado/usuario, equipo, dominio) que puebla contexto/ y deja el repo listo para el primer Shape.
version: 1.0
status: active
triggers: ["fundación de contexto", "etapa 0", "corre la fundación", "poblar el contexto inicial", "arranquemos el producto", "onboarding del producto"]
requires_context: ["context-repo recién instanciado (p60 init)", "CLAUDE.md del context-repo"]
last_sync: 2026-07-14
---

# Fundación de Contexto (Etapa 0)

> Convierte al agente en el entrevistador de fundación: extrae del equipo la evidencia raíz — negocio, mercado/usuario temprano, equipo y dominio — y la deja escrita donde el resto del framework la va a buscar. Sin esta base, el discovery prioriza en el vacío.

## When to Use

Actívalo **una vez por producto**, inmediatamente después de `p60 init`, o cuando un producto existente adopta P60 y hay que reconstruir su fundación. Re-actívalo solo ante cambios de fondo (pivot, nueva estrategia, cambio de equipo).

**NO** lo uses para: discovery de oportunidades (eso es Shape, con la fundación ya puesta), ni para mantener la estrategia al día (eso es edición normal de `contexto/`).

## Procedure

1. **Encuadre (2 min).** Explica al humano qué va a pasar: una entrevista por bloques (~30–45 min en total), se puede pausar y retomar; cada bloque termina con un archivo que él valida.
2. **Bloque Negocio** → `contexto/negocio/`: modelo de negocio (cómo gana dinero o ganará), estrategia y objetivos corto/mediano/largo plazo, restricciones (runway, regulación, dependencias). Pregunta con historias concretas, no definiciones ("¿qué pasó el último trimestre que te preocupa?").
3. **Bloque Mercado / Usuario temprano** → `contexto/mercado-usuario/`: a quién sirve, competencia/alternativas, y **toda evidencia ya existente** (entrevistas viejas, métricas, señales de demanda). Lo que sea material bruto **va a `_inbox/`** y se procesa con `bibliotecario-evidencia` — la fundación nace catalogada.
4. **Bloque Equipo** → `contexto/equipo/`: quiénes son, roles, escala (PB/tríada/squad), modelo de trabajo, quién decide qué (esto calibra los checkpoints de juicio).
5. **Bloque Dominio** → `contexto/dominio/`: glosario de términos del negocio (los que un agente podría malinterpretar primero), tech-stack si existe, ADRs iniciales, design system semilla si hay.
6. **Outcome candidato.** Cierra proponiendo 1–3 outcomes candidatos (comportamiento medible, no output) derivados de lo escuchado. **No los fijes**: quedan como propuesta en `contexto/estrategia/` para que el humano elija al abrir Shape (checkpoint de juicio #1).
7. **Cierre.** Actualiza el **Estado del ciclo** en el `CLAUDE.md` del context-repo, registra la sesión en `bitacora/bitacora-agentica.md` y resume qué quedó poblado y qué quedó pendiente (con dueño).

## Pitfalls

- **Cuestionario burocrático.** Si el humano responde con una palabra, pide la historia detrás. La fundación es evidencia, no formulario.
- **Aceptar outputs como objetivos** ("lanzar la app en marzo"). → "¿Qué cambia en el comportamiento de tus usuarios si eso sale bien?"
- **Evidencia vieja sin catalogar.** Mencionan "tenemos entrevistas de antes" y quedan en un drive. → A `_inbox/` ahora, aunque se procesen después.
- **Perfeccionismo de Etapa 0.** La fundación habilita el primer ciclo, no lo reemplaza. Si un bloque está flaco, se anota el gap y se sigue — Shape lo va a encontrar.
- **Fijar el outcome en la fundación.** Es tentador cerrar con todo definido; la elección del outcome es del humano en Shape, con el OST delante.

## Verification

- [ ] Las 4 carpetas de fundación pobladas (o su gap anotado con dueño y fecha).
- [ ] Todo material bruto mencionado quedó en `_inbox/` (o ya fichado como EV-NNN).
- [ ] 1–3 outcomes candidatos propuestos (medibles), sin fijar.
- [ ] `CLAUDE.md` del producto con Estado del ciclo actualizado; bitácora con la sesión.
- [ ] El humano validó cada bloque antes de darlo por poblado.
