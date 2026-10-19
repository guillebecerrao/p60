# OST Facilitator — Metodología (reference)

> Material profundo cargable on-demand. Basado en Teresa Torres, *Continuous Discovery Habits* (2021), caps. 6, 7 y 10.

## Fundamentos

### Estructura del OST (4 niveles)
```
OUTCOME DESEADO
  ├─ OPORTUNIDADES (nivel 1: momentos del customer journey)
  │     └─ Sub-oportunidades (niveles 2-3)
  ├─ SOLUCIONES (para la oportunidad target)
  └─ ASSUMPTION TESTS (por solución candidata)
```

### Definiciones
- **Outcome:** cambio en el comportamiento del usuario que genera valor de negocio. Es la raíz. No es un output (feature), es un impacto medible.
- **Oportunidad:** necesidad, pain point o deseo del usuario que, resuelto, podría impulsar el outcome. Siempre desde la perspectiva del usuario.
- **Solución:** apuesta de cómo resolver una oportunidad target. Múltiples por oportunidad.
- **Assumption test:** experimento ligero para validar los supuestos más riesgosos antes de construir.

### Principios
1. Las oportunidades no son soluciones. Si se expresa como "implementar X", es solución.
2. Se expresan desde el usuario (test: ¿puede un usuario decirlo?).
3. Padre-hijo = la hija es subconjunto de la padre.
4. Hermanas = distintas; se puede resolver una sin la otra.
5. Foco en una oportunidad target a la vez; explorar múltiples soluciones.
6. El árbol es un artefacto vivo.

## Protocolo detallado por paso

### Paso 1 — Clarificar el Outcome
| Criterio | Pregunta diagnóstica |
|----------|---------------------|
| ¿Outcome, no output? | "¿Es un número o un comportamiento?" |
| ¿En el span de control? | "¿Puede el equipo moverlo sin depender de otros?" |
| ¿Product vs business outcome? | "¿Conecta con lo que el producto hace?" |
| ¿Métrica definible? | "¿Cómo sabrías que lo lograste?" |
| ¿Leading o lagging? | "¿Cuánto tarda en verse el impacto?" |

### Paso 2 — Branches (momentos clave)
Mutuamente excluyentes. Identificar vía experience map, momentos temporales del journey, o "¿cuáles son las etapas distintas por las que pasa el usuario?". Ejemplo Torres: "Decidir qué mirar / Elegir qué mirar / Mirar algo / Fin de la experiencia".

### Paso 3 — Filtro de inclusión
1. ¿Enmarcada como necesidad/pain/deseo y NO como solución?
2. ¿Aparece en >1 fuente, o es muy fuerte aunque única?
3. ¿Resolverla impulsaría el outcome?
Tres "sí" → incluir. Formato: *"[cita/paráfrasis en 1ª persona]" — evidencia (n/N)*.

### Paso 4 — Estructura
Test de distinción (hermanas): "¿resuelvo A sin B?". Test de inclusión (padre-hijo): "¿es B un caso específico de A?".

### Paso 5 — Confianza
| Nivel | Criterios |
|-------|-----------|
| ALTA | n≥3/N + patrón consistente + sin contradicciones |
| MEDIA-ALTA | n=2-3/N emergente, o n=1 de fuente muy creíble |
| MEDIA | n=1-2/N sin corroboración fuerte |
| BAJA | Hipótesis del equipo, no escuchada en entrevistas |

### Paso 6 — Priorización (compare and contrast)
Cuatro lentes: **Opportunity sizing** (cuántos, con qué frecuencia) · **Market factors** (table stakes vs diferenciador) · **Company factors** (alineación estratégica, ventaja) · **Customer factors** (importancia, insatisfacción con soluciones actuales). Proceso top-down: comparar branches → hijos → hasta leaf node.

### Paso 7 — Soluciones
Nunca una sola; ≥3 para compare-and-contrast. Técnicas: ideación individual primero, "How Might We", analogías, benchmarks, variación sistemática.

### Paso 8 — Supuestos y tests
Categorías: deseabilidad, usabilidad, viabilidad, factibilidad. Priorizar por riesgo × desconocimiento. Test más ligero: Fake Door, Concierge, Wizard of Oz, prototipo desechable, encuesta.

## Tabla completa de anti-patrones
| Anti-patrón | Señal | Corrección |
|-------------|-------|-----------|
| Oportunidades verticales | Padre con un solo hijo | Buscar hermanos faltantes |
| Oportunidades solapadas | Podría ir en dos lugares | Ser más específica |
| Sin parent | Flotan sin estructura | Ubicar el momento del journey |
| = soluciones | "Quiero push" | "¿para qué?", capturar necesidad |
| = sentimientos | "Me frustra" | Buscar la causa |
| Demasiado amplias | "La interfaz es difícil" | ¿En qué momento, para qué? |

## Outputs por tipo de sesión
- **A (docs→OST):** oportunidades extraídas por doc · ubicación propuesta · confianza · nuevas vs refuerzo · OST actualizado en markdown.
- **B (revisión de calidad):** diagnóstico por anti-patrón · reencuadres · gaps · preguntas para próximas entrevistas.
- **C (priorización):** análisis comparativo de branches · razonamiento por lens · target recomendada + descartadas.
- **D (solution space):** ≥3 soluciones · tabla de supuestos · supuesto más riesgoso · test más ligero.

## Checklist de OST saludable
Estructura: outcome = comportamiento · branches no solapados · ≥2 hermanas por nivel · sin verticales · leaf nodes al trabajar soluciones.
Calidad: voz del usuario · ninguna = solución · ninguna = sentimiento sin causa · con evidencia · con confianza.
Proceso: target seleccionada (leaf) · ≥3 soluciones · supuestos riesgosos identificados · ≥1 test en curso/planificado.
