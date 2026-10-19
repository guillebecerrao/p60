# CLAUDE.md — Context repo de [PRODUCTO]

> Memória curada do context repo de **[PRODUCTO]**, operado com o framework **P60**.
> Curta de propósito (~1 tela). Leia no início de cada sessão. O aprofundamento vive nos arquivos linkados.
> Regras de comportamento do agente: `framework.md` → constituição P60. Skills disponíveis: índice do framework (`skills/_index.md` no repo P60).

## O que é este repo

O **sistema operacional de produto** de [PRODUCTO]: discovery, specs, evidências e decisões. Separado do código (a implementação vive no seu próprio repo — ver ADR-001 do framework). O agente constrói contexto aqui e código lá.

> **Nota:** os nomes das pastas são estrutura canônica do framework (fazem parte da lógica do pipeline) e não se traduzem. O conteúdo está em português (BR).

## Status do ciclo (atualizar ao fechar cada subprocesso)

| Dimensão | Status |
|----------|--------|
| **Subprocesso ativo** | Etapa 0 — Fundação de contexto |
| **Oportunidade alvo (OST)** | — |
| **Aposta / apetite vigente** | — |
| **Última sessão** | ver `bitacora/bitacora-agentica.md` |

## Mapa de navegação

| Preciso de… | Vou para… |
|-------------|-----------|
| A estratégia e o OST (fonte única) | `contexto/estrategia/ost.md` |
| Saber que evidências existem | `contexto/evidencia/_index.md` → fichas → só então o original |
| A fundação (negócio, mercado, time, domínio) | `contexto/negocio/` · `contexto/mercado-usuario/` · `contexto/equipo/` · `contexto/dominio/` |
| O trabalho do ciclo em andamento | `shape/` · `ideate/` · `validate/` |
| PRDs e specs de desenvolvimento | `handoff-delivery/epicas/[epico]/` |
| Experimentos pós-build | `experimentacion/pipeline.md` |
| O que aconteceu em sessões anteriores | `bitacora/` |

## Onde vai cada coisa (resolver — ler ANTES de criar um arquivo novo)

| É… | Vai em… | NÃO vai em… |
|----|---------|-------------|
| Material bruto (transcrição, export, relatório) | `contexto/evidencia/_inbox/` → processado por `bibliotecario-evidencia` | direto numa pasta de contexto (sem ficha não é pesquisável) |
| Uma oportunidade ou insight de discovery | o OST (nó) + a ficha EV que o respalda | um doc solto em `shape/` |
| Uma ideia de solução | `ideate/oportunidades/[opp]/candidatas.md` | o OST (lá só se referencia) |
| Uma premissa e seu teste | `validate/oportunidades/[opp]/[idea]/` (mapa + PRD-brief) | `handoff-delivery/` (lá só chega o validado) |
| Uma spec de desenvolvimento | `handoff-delivery/epicas/[epico]/features/[feature]/` | `validate/` (isso é nível brief) |
| O que você não sabe onde arquivar | `contexto/evidencia/_inbox/` — se resolve ao processar | inventar uma pasta nova |

## Regras locais

1. **Localização = estado.** `validate/` livre · `activas/` congelado · `cerradas/` e `_historia/` backup (não ler por padrão).
2. **Citar siglas** (`EV-NNN`, nós do OST, `ADR-NNN`), nunca caminhos nem cópias.
3. **Checkpoints de julgamento humanos:** escolher outcome/aposta, validar síntese de IA, ship/no-ship.
4. Este arquivo se mantém curto; o que cresce vai para `bitacora/`.

*Instanciado por `p60 init` em [FECHA]. Framework P60 v2.*
