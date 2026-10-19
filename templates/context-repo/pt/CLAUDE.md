# CLAUDE.md — Context repo de [PRODUCTO]

> Memória curada do context repo de **[PRODUCTO]**, operado com o framework **P60**.
> Curta de propósito (~1 tela). Leia no início de cada sessão. O aprofundamento vive nos arquivos linkados.
> Regras de comportamento do agente: `p60/framework.md` → constituição (`p60/_framework/memory/constitution.md`). Skills disponíveis: `p60/_framework/skills-index.md`.

## O que é este repo

O **sistema operacional de produto** de [PRODUCTO]: discovery, specs, evidências e decisões. Tudo vive em `p60/`, sem se misturar com código: por padrão o código está em outro repo; se este projeto também o hospeda, o código vive fora de `p60/` (p. ex. `src/` ou `site/`): o P60 não o governa e os guardrails não o tocam. O agente constrói contexto em `p60/` e o código no seu lugar. Um spike de código antes da Etapa 0 (infraestrutura, uma primeira página) é válido: registre-o na bitácora e traga o aprendizado depois como evidência.

> **Nota:** os nomes das pastas são estrutura canônica do framework (fazem parte da lógica do pipeline) e não se traduzem. O conteúdo está em português (BR).

## Status do ciclo (atualizar ao fechar cada subprocesso)

| Dimensão | Status |
|----------|--------|
| **Subprocesso ativo** | Etapa 0 — Fundação de contexto |
| **Oportunidade alvo (OST)** | — |
| **Aposta / apetite vigente** | — |
| **Última sessão** | ver `p60/bitacora/bitacora-agentica.md` |

## Mapa de navegação

| Preciso de… | Vou para… |
|-------------|-----------|
| A estratégia e o OST (fonte única) | `p60/contexto/estrategia/ost.md` |
| Saber que evidências existem | `p60/contexto/evidencia/_index.md` → fichas → só então o original |
| A fundação (negócio, mercado, time, domínio) | `p60/contexto/negocio/` · `p60/contexto/mercado-usuario/` · `p60/contexto/equipo/` · `p60/contexto/dominio/` |
| O trabalho do ciclo em andamento | `p60/shape/` · `p60/ideate/` · `p60/validate/` |
| PRDs e specs de desenvolvimento | `p60/handoff-delivery/epicas/[epico]/` |
| Experimentos pós-build | `p60/experimentacion/pipeline.md` |
| O que aconteceu em sessões anteriores | `p60/bitacora/` |

## Onde vai cada coisa (resolver — ler ANTES de criar um arquivo novo)

| É… | Vai em… | NÃO vai em… |
|----|---------|-------------|
| Material bruto (transcrição, export, relatório) | `p60/contexto/evidencia/_inbox/` → processado por `bibliotecario-evidencia` | direto numa pasta de contexto (sem ficha não é pesquisável) |
| Uma oportunidade ou insight de discovery | o OST (nó) + a ficha EV que o respalda | um doc solto em `p60/shape/` |
| Uma ideia de solução | `p60/ideate/oportunidades/[opp]/candidatas.md` | o OST (lá só se referencia) |
| Uma premissa e seu teste | `p60/validate/oportunidades/[opp]/[idea]/` (mapa + PRD-brief) | `p60/handoff-delivery/` (lá só chega o validado) |
| Uma spec de desenvolvimento | `p60/handoff-delivery/epicas/[epico]/features/[feature]/` | `p60/validate/` (isso é nível brief) |
| O que você não sabe onde arquivar | `p60/contexto/evidencia/_inbox/` — se resolve ao processar | inventar uma pasta nova |

## Regras locais

1. **Localização = estado.** `p60/validate/` livre · `activas/` congelado · `cerradas/` e `_historia/` backup (não ler por padrão).
2. **Citar siglas** (`EV-NNN`, nós do OST, `ADR-NNN`), nunca caminhos nem cópias.
3. **Checkpoints de julgamento humanos:** escolher outcome/aposta, validar síntese de IA, ship/no-ship.
4. Este arquivo se mantém curto; o que cresce vai para `p60/bitacora/`.

*Instanciado por `p60 init` em [FECHA]. Framework P60 v[VERSION] (ver `p60/_framework/VERSION`).*
