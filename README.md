# P60

**[Español](#español) · [Português](#português) · [English](#english)**

> P60 se usa en **español, portugués o inglés**: `p60 init --lang es|pt|en` genera todo el contexto de tu producto en el idioma de tu equipo. Hecho en LATAM, para product builders de cualquier lugar.
>
> O P60 funciona em **espanhol, português ou inglês** · P60 works in **Spanish, Portuguese or English**.

---

## Español

> **Saber qué construir, antes de construirlo rápido.**

Con agentes de IA, construir rápido dejó de ser el problema. El problema es lo que viene antes: *¿qué construyo, por qué eso y no otra cosa, y cómo le doy al agente el contexto para que lo que construya le importe al usuario y al negocio?* Un agente con contexto pobre construye rápido, pero construye lo equivocado.

P60 convierte una carpeta en el **sistema de contexto de tu producto**: estrategia, evidencia, oportunidades y specs en markdown versionado con git, operado con Claude Code. Sirve para una persona sola (product builder), una tríada o un squad. **El agente prepara y recomienda; tú decides.**

> **Nada se construye sin spec. Ninguna spec se escribe sin evidencia. Todo lo construido se valida.**

### Míralo funcionar

Un ejemplo inventado: *Brote*, una suscripción de café de especialidad que pierde clientes en el tercer mes.

```text
Tú:     corre la fundación de contexto
Claude: [fundacion-etapa-0] Te entrevisto por bloques: negocio, mercado y usuario, equipo, dominio.
        … Listo p60/contexto/. ¿Tienes material previo? Lo dejo catalogado.
Tú:     sí, 6 entrevistas a clientes que cancelaron (las pego)
Claude: [bibliotecario-evidencia] Fichas EV-001 a EV-006 e índice actualizado.
        Revisa los hallazgos antes de que los use: los resúmenes de IA pierden matices.
Tú:     revisados. Creemos el OST
Claude: [ost-facilitator] Outcome propuesto: "retención al mes 4 de 41% a 55%".
        4 oportunidades con su evidencia. La más respaldada: "cancelo porque se me
        acumula el café cuando viajo" [EV-002, EV-005]. ¿Cuál persigues y con cuánto apetito?
Tú:     esa, con 2 semanas de apetito
Claude: [ideacion-estructurada] 9 ideas → 3 candidatas: pausar un envío, frecuencia
        flexible, regalar el envío a un amigo. Tú eliges cuáles siguen.
Tú:     las dos primeras
Claude: [assumption-testing] Supuesto más riesgoso: "quien puede pausar no cancela".
        Test más barato: botón "pausar" en el flujo de cancelación (fake door).
        Umbral registrado ANTES de ver datos: ≥ 25% elige pausar.
        … resultado 34%. Te propongo "pausar un envío" como selected.
Tú:     de acuerdo
Claude: [redactar-prd] PRD de feature + 2 Iteration PRDs (rebanadas verticales).
        Al aprobarlos pasan a activas/ y quedan congelados.
        … se construyen en el repo de código …
Tú:     diseñemos el experimento
Claude: [disenar-experimento] A/B al 50%, corte el 30 de noviembre, umbral pre-registrado.
        … llega el corte …
Claude: [decision-ship] Retención +6 pts, sobre el umbral. Recomiendo ship. Decides tú.
```

De una idea vaga a una decisión con evidencia, y cada paso queda trazado en `p60/`.

### Cómo funciona: giro, filtro, goteo

El nombre viene de la **V60**, la cafetera de filtrado manual. La P es de producto.

| En la V60 | En P60 |
|-----------|--------|
| **El giro** al verter el agua | **Discovery y delivery continuos.** Contacto con usuarios cada semana; mientras una feature se construye, el discovery de la siguiente ya gira. |
| **El filtro** | **Criterio.** La evidencia, los umbrales y tres decisiones humanas filtran qué llega a construirse. |
| **El goteo** | **Cadencia.** Valor en gotas verificables: fichas de evidencia, rebanadas shippeables, experimentos con fecha de corte. |

### Las etapas

```text
Instalar → Etapa 0 → Shape → Ideate → Validate → Handoff → Build → Experimentación ─┐
           Fundación  ▲                                                             │
                      └─────────────────────── aprendizaje ─────────────────────────┘
```

| Etapa | Dile al agente… | Skill | Qué sale y dónde | Sales cuando… |
|-------|-----------------|-------|------------------|---------------|
| **Etapa 0** · Fundación | "Corre la fundación de contexto" | `fundacion-etapa-0` | Negocio, mercado, equipo y dominio en `p60/contexto/` | Las cuatro fundaciones están pobladas |
| **Shape** | "Creemos el OST" · "Procesa esta transcripción" | `ost-facilitator` `interview-snapshot` `brief-entrevista` | `p60/contexto/estrategia/ost.md`, snapshots en `p60/shape/` | **Tú** eliges la oportunidad y el apetito |
| **Ideate** | "Generemos ideas para la oportunidad target" | `ideacion-estructurada` | `p60/ideate/oportunidades/[opp]/candidatas.md` | **Tú** preseleccionas candidatas |
| **Validate** | "Mapea los supuestos de esta candidata" | `assumption-testing` `brief-test-no-moderado` | Mapa de supuestos y PRD-brief en `p60/validate/` | Hay una solución `selected` con evidencia |
| **Handoff** | "Madura el brief seleccionado a PRD" | `redactar-prd` | PRD Maestro, PRD de feature, ADR e Iteration PRDs en `p60/handoff-delivery/` | **Tú** apruebas el Iteration PRD (queda congelado) |
| **Build** | *(en el repo de código, con el Iteration PRD como input)* | Speckit o tu equipo | Producto funcionando | Desplegado y verificado |
| **Experimentación** | "Diseñemos el experimento" · "Llegó el corte: decidamos" | `disenar-experimento` `decision-ship` | `p60/experimentacion/experimentos/` | **Tú** decides ship, no-ship o iterar |

**En cualquier momento:** "deja esto en el inbox" (`bibliotecario-evidencia`: ficha `EV-NNN` buscable), "cerremos el ciclo" (`cierre-de-ciclo`), "genera el HTML del OST para presentarlo" (`generar-presentacion-html`).

### Las preguntas que te tienes que hacer

- **Etapa 0:** ¿Qué tiene que lograr el negocio en 3, 12 y 36 meses? ¿Qué sabemos del usuario y qué solo creemos?
- **Shape:** ¿Qué outcome queremos mover? ¿Qué oportunidad tiene más evidencia e impacto? ¿Cuánto apetito le damos *antes* de pensar soluciones?
- **Ideate:** ¿Cuáles caben en el apetito? ¿Exploramos ideas realmente distintas?
- **Validate:** ¿Qué supuesto, si es falso, mata la idea? ¿Cuál es el test más barato? ¿Qué umbral fijamos antes de ver resultados?
- **Handoff:** ¿Cada rebanada se puede usar y verificar sola? ¿Queda alguna pregunta abierta para quien construye?
- **Build:** ¿Cabe en el apetito? Si no cabe, vuelve a Shape re-dimensionado: no se extiende por defecto.
- **Experimentación:** ¿El resultado alcanzó el umbral, o estamos leyendo lo que queremos ver?

### Las tres decisiones que el agente nunca toma

1. **Qué perseguir:** outcome, oportunidad, candidatas y apetito.
2. **Qué cuenta como evidencia:** toda síntesis de IA la validas tú antes de que entre al OST o a un PRD.
3. **Qué se consolida:** ship, no-ship o iterar.

Además, un guardarraíl pide confirmación humana antes de tocar una spec congelada (`activas/`) o la constitución.

### Empezar

**Prerequisitos:** [Claude Code](https://claude.com/claude-code), `git`, `bash`, `python3`, `curl` y `tar` (macOS y Linux; en Windows, Git Bash o WSL).

Desde la carpeta de tu producto, deja que Claude lo instale (te muestra el plan antes de escribir nada):

```bash
curl -fsSL https://raw.githubusercontent.com/guillebecerrao/p60/main/install.md | claude
```

O a mano:

```bash
curl -fsSL https://raw.githubusercontent.com/guillebecerrao/p60/main/install.sh | bash   # una vez por computador
cd mi-producto
p60 init        # te muestra el plan y pregunta nombre, escala e idioma
claude          # ábrelo siempre desde esta carpeta
```

Primera frase: *"corre la fundación de contexto"*.

Todo queda en una carpeta `p60/` autocontenida y compartible por git; afuera solo `.claude/` y un bloque en tu `CLAUDE.md`. Por defecto el contexto va en un repo propio, separado del código; en proyectos chicos puedes ponerlo dentro del codebase.

| Comando | Para qué |
|---------|----------|
| `p60 init` | Convierte la carpeta actual en context repo |
| `p60 update` | Actualiza el framework sin pisar lo que editaste |
| `p60 doctor` | Revisa prerequisitos, versión y guardarraíles |
| `p60 skills` · `p60 agents` | Qué sabe hacer el agente y sus perfiles expertos |
| `p60 self-update` | Actualiza el comando en tu computador |

### Seguir leyendo

- [Instalación en detalle](docs/instalacion.md): qué se crea, actualizar, desinstalar, problemas comunes.
- [Arranque rápido](docs/arranque-rapido.md): de cero a primer ciclo en 10 minutos, con una demo guiada.
- [Guía del framework](docs/P60-Framework-Guide.md): el método completo (30 minutos).
- [Constitución](.p60/memory/constitution.md): principios y reglas del agente.
- [CHANGELOG](CHANGELOG.md).

<details>
<summary>Estructura de este repo (para contribuir)</summary>

Este es el **repo del framework**, la fuente que cada producto instancia con `p60 init`.

```text
P60/
├── CLAUDE.md              # memoria curada de navegación
├── .p60/memory/           # constitución
├── .p60/registry/         # registry de agentes
├── .claude/agents/        # subagentes nativos de Claude Code
├── agents/                # system prompts canónicos + _specs/
├── skills/                # protocolos de tarea + _standards/
├── templates/             # semilla del context repo y artefactos, en es/en/pt
├── tools/                 # CLI p60, p60-lint, hooks + _specs/
├── install.sh · install.md
├── docs/                  # guía, arranque rápido, instalación, ADRs, quickstart/etapas.json
└── _standards/            # estándar de specs de componentes
```

`docs/quickstart/etapas.json` es la fuente única (es/pt/en) de las etapas, frases, skills, artefactos y preguntas que muestran este README y p60.lat.

</details>

---

## Português

> **Saber o que construir, antes de construir rápido.**

Com agentes de IA, construir rápido deixou de ser o problema. O problema é o que vem antes: *o que eu construo, por que isso e não outra coisa, e como dou ao agente o contexto para que o que ele construir importe ao usuário e ao negócio?* Um agente com pouco contexto constrói rápido, mas constrói a coisa errada.

O P60 transforma uma pasta no **sistema de contexto do seu produto**: estratégia, evidências, oportunidades e specs em markdown versionado com git, operado com o Claude Code. Serve para uma pessoa sozinha (product builder), uma tríade ou um squad. **O agente prepara e recomenda; você decide.**

> **Nada se constrói sem spec. Nenhuma spec se escreve sem evidência. Tudo o que é construído é validado.**

### Veja funcionando

Um exemplo inventado: *Brote*, uma assinatura de café especial que perde clientes no terceiro mês.

```text
Você:   rode a fundação de contexto
Claude: [fundacion-etapa-0] Vou te entrevistar por blocos: negócio, mercado e usuário,
        equipe, domínio. … Pronto: p60/contexto/. Tem material prévio? Eu catalogo.
Você:   sim, 6 entrevistas com clientes que cancelaram (colo aqui)
Claude: [bibliotecario-evidencia] Fichas EV-001 a EV-006 e índice atualizado.
        Revise os achados antes que eu os use: resumos de IA perdem nuances.
Você:   revisados. Vamos criar a OST
Claude: [ost-facilitator] Outcome proposto: "retenção no mês 4 de 41% para 55%".
        4 oportunidades com suas evidências. A mais sustentada: "cancelo porque o café
        acumula quando viajo" [EV-002, EV-005]. Qual você persegue e com quanto apetite?
Você:   essa, com 2 semanas de apetite
Claude: [ideacion-estructurada] 9 ideias → 3 candidatas. Você escolhe quais seguem.
Você:   pausar um envio e frequência flexível
Claude: [assumption-testing] Premissa mais arriscada: "quem pode pausar não cancela".
        Teste mais barato: botão "pausar" no fluxo de cancelamento (fake door).
        Limiar registrado ANTES de ver os dados: ≥ 25% escolhe pausar. … resultado 34%.
Claude: [redactar-prd] PRD de feature + 2 Iteration PRDs. Ao aprovar, ficam congelados.
        … construção no repo de código …
Claude: [decision-ship] Retenção +6 pts, acima do limiar. Recomendo ship. Você decide.
```

### Como funciona: giro, filtro, gotejamento

O nome vem da **V60**, a cafeteira de filtragem manual. O P é de produto.

| Na V60 | No P60 |
|--------|--------|
| **O giro** ao despejar a água | **Discovery e delivery contínuos.** Contato com usuários toda semana; enquanto uma feature é construída, o discovery da próxima já gira. |
| **O filtro** | **Critério.** Evidências, limiares e três decisões humanas filtram o que chega a ser construído. |
| **O gotejamento** | **Cadência.** Valor em gotas verificáveis: fichas de evidência, fatias entregáveis, experimentos com data de corte. |

### As etapas

| Etapa | Diga ao agente… | Skill | O que sai e onde |
|-------|-----------------|-------|------------------|
| **Etapa 0** · Fundação | "Rode a fundação de contexto" | `fundacion-etapa-0` | Negócio, mercado, equipe e domínio em `p60/contexto/` |
| **Shape** | "Vamos criar a OST" · "Processe esta transcrição" | `ost-facilitator` `interview-snapshot` `brief-entrevista` | `p60/contexto/estrategia/ost.md`, snapshots em `p60/shape/` |
| **Ideate** | "Vamos gerar ideias para a oportunidade alvo" | `ideacion-estructurada` | `p60/ideate/oportunidades/[opp]/candidatas.md` |
| **Validate** | "Mapeie as premissas desta candidata" | `assumption-testing` `brief-test-no-moderado` | Mapa de premissas e PRD-brief em `p60/validate/` |
| **Handoff** | "Amadureça o brief selecionado em PRD" | `redactar-prd` | PRD Mestre, PRD de feature, ADR e Iteration PRDs em `p60/handoff-delivery/` |
| **Build** | *(no repo de código, com o Iteration PRD como input)* | Speckit ou sua equipe | Produto funcionando |
| **Experimentação** | "Vamos desenhar o experimento" · "Chegou o corte: vamos decidir" | `disenar-experimento` `decision-ship` | `p60/experimentacion/experimentos/` |

Os skills podem ser chamados em qualquer idioma; os nomes de pastas são canônicos e não mudam.

### As três decisões que o agente nunca toma

1. **O que perseguir:** outcome, oportunidade, candidatas e apetite.
2. **O que conta como evidência:** você valida toda síntese de IA antes de entrar na OST ou em um PRD.
3. **O que se consolida:** ship, no-ship ou iterar.

### Começar

Pré-requisitos: [Claude Code](https://claude.com/claude-code), `git`, `bash`, `python3`, `curl` e `tar`.

```bash
curl -fsSL https://raw.githubusercontent.com/guillebecerrao/p60/main/install.md | claude
```

Ou manualmente: `curl -fsSL https://raw.githubusercontent.com/guillebecerrao/p60/main/install.sh | bash`, depois `cd meu-produto && p60 init --lang pt && claude`. Primeira frase: *"rode a fundação de contexto"*.

A documentação detalhada ainda está em espanhol: [instalação](docs/instalacion.md) · [guia do framework](docs/P60-Framework-Guide.md).

---

## English

> **Know what to build, before you build it fast.**

With AI agents, building fast is no longer the problem. The problem is what comes before: *what do I build, why this and not something else, and how do I give the agent enough context that what it builds matters to the user and the business?* An agent with poor context builds fast, and builds the wrong thing.

P60 turns a folder into your **product's context system**: strategy, evidence, opportunities and specs as git-versioned markdown, run with Claude Code. It works for a solo product builder, a triad or a full squad. **The agent prepares and recommends; you decide.**

> **Nothing gets built without a spec. No spec gets written without evidence. Everything built gets validated.**

### See it work

A made-up example: *Brote*, a specialty coffee subscription that loses customers in month three.

```text
You:    run the context foundation
Claude: [fundacion-etapa-0] I'll interview you in blocks: business, market and users,
        team, domain. … Done: p60/contexto/. Got existing material? I'll catalog it.
You:    yes, 6 interviews with customers who cancelled (pasting them)
Claude: [bibliotecario-evidencia] Cards EV-001 to EV-006, index updated.
        Review the findings before I use them: AI summaries lose nuance.
You:    reviewed. Let's build the OST
Claude: [ost-facilitator] Proposed outcome: "month-4 retention from 41% to 55%".
        4 opportunities with their evidence. Best supported: "I cancel because coffee
        piles up when I travel" [EV-002, EV-005]. Which one, and with how much appetite?
You:    that one, 2 weeks of appetite
Claude: [ideacion-estructurada] 9 ideas → 3 candidates. You pick which go on.
You:    skip a delivery, and flexible frequency
Claude: [assumption-testing] Riskiest assumption: "people who can pause don't cancel".
        Cheapest test: a "pause" button in the cancel flow (fake door).
        Threshold registered BEFORE seeing data: ≥ 25% choose pause. … result: 34%.
Claude: [redactar-prd] Feature PRD + 2 Iteration PRDs. Once approved, they're frozen.
        … built in the code repo …
Claude: [decision-ship] Retention +6 pts, above threshold. I recommend ship. You decide.
```

### How it works: pour, filter, drip

The name comes from the **V60**, the pour-over coffee dripper. The P is for product.

| In the V60 | In P60 |
|------------|--------|
| **The pour**, in circles | **Continuous discovery and delivery.** Talk to users every week; while one feature is built, discovery for the next is already turning. |
| **The filter** | **Judgment.** Evidence, thresholds and three human decisions filter what gets built. |
| **The drip** | **Cadence.** Value in verifiable drops: evidence cards, shippable slices, experiments with a cut-off date. |

### The stages

| Stage | Tell the agent… | Skill | What comes out, and where |
|-------|-----------------|-------|---------------------------|
| **Stage 0** · Foundation | "Run the context foundation" | `fundacion-etapa-0` | Business, market, team and domain in `p60/contexto/` |
| **Shape** | "Let's build the OST" · "Process this transcript" | `ost-facilitator` `interview-snapshot` `brief-entrevista` | `p60/contexto/estrategia/ost.md`, snapshots in `p60/shape/` |
| **Ideate** | "Let's generate ideas for the target opportunity" | `ideacion-estructurada` | `p60/ideate/oportunidades/[opp]/candidatas.md` |
| **Validate** | "Map this candidate's assumptions" | `assumption-testing` `brief-test-no-moderado` | Assumption map and PRD-brief in `p60/validate/` |
| **Handoff** | "Mature the selected brief into a PRD" | `redactar-prd` | Master PRD, feature PRD, ADR and Iteration PRDs in `p60/handoff-delivery/` |
| **Build** | *(in the code repo, with the Iteration PRD as input)* | Speckit or your team | Working product |
| **Experimentation** | "Let's design the experiment" · "Cut-off reached: let's decide" | `disenar-experimento` `decision-ship` | `p60/experimentacion/experimentos/` |

You can call skills in any language; folder names are canonical and stay the same.

### The three decisions the agent never makes

1. **What to pursue:** outcome, opportunity, candidates and appetite.
2. **What counts as evidence:** you validate every AI synthesis before it enters the OST or a PRD.
3. **What gets consolidated:** ship, no-ship or iterate.

### Get started

Prerequisites: [Claude Code](https://claude.com/claude-code), `git`, `bash`, `python3`, `curl` and `tar`.

```bash
curl -fsSL https://raw.githubusercontent.com/guillebecerrao/p60/main/install.md | claude
```

Or by hand: `curl -fsSL https://raw.githubusercontent.com/guillebecerrao/p60/main/install.sh | bash`, then `cd my-product && p60 init --lang en && claude`. First thing to say: *"run the context foundation"*.

Detailed docs are in Spanish for now: [installation](docs/instalacion.md) · [framework guide](docs/P60-Framework-Guide.md).

---

*Creado por Guille Becerra O — hello@guillebecerrao.cl*
