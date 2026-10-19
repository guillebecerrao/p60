# Template — Context Repo P60 (pt-BR)

> Estrutura canônica do **context repo** de um produto. O `p60 init` a clona e popula.
> Autocontido e separado do código. Método completo: `docs/P60-Framework-Guide.md`.
> **Os nomes das pastas são estrutura canônica do framework** (lógica do pipeline — referenciados por skills e agentes) **e não se traduzem**; o conteúdo dos arquivos é localizado.

```
[produto]-context/
├── CLAUDE.md                       # navegação do context repo
├── framework.md                    # ponteiro para a constituição P60
│
├── contexto/                       # ── Etapa 0: Fundação + contexto vivo ──
│   ├── negocio/                    # modelo de negócio, estratégia, objetivos de curto/médio/longo prazo
│   ├── mercado-usuario/            # contexto de mercado + usuários iniciais (entrevistas, early adopters)
│   ├── equipo/                     # estrutura organizacional, squad, papéis, modelo de trabalho
│   ├── dominio/                    # glossário, design system semente, stack + ADRs
│   ├── estrategia/                 # ost.md (fonte única), evidência validada, backlog, roadmaps
│   └── evidencia/                  # sistema de evidências — padrão bibliotecário
│       ├── _inbox/                 # entrada: deixe aqui o material bruto
│       ├── _index.md               # catálogo: uma linha por ficha (primeira parada de toda busca)
│       ├── fichas/                 # EV-NNN-[slug].md — substitutos leves dos originais
│       └── originales/             # originais sem destino natural em outra pasta de contexto
│
├── shape/                          # ── Subprocesso 1 ── discovery + priorização
├── ideate/                         # ── Subprocesso 2 ── geração de ideias de solução
├── validate/                       # ── Subprocesso 3 ── PRD-brief + protótipo low-fi + validação
│
├── handoff-delivery/               # ── Subprocesso 4 ──
│   └── epicas/[epico]/
│       ├── prd-maestro.md          # PRD Mestre (épico, vivo)
│       └── features/[feature]/
│           ├── prd-[feature].md    # PRD de feature validado + ADR + protótipo hi-fi
│           ├── activas/            # Iteration PRD em janela de sprint (congelado)
│           └── cerradas/           # implementado (backup-como-contexto)
│
├── experimentacion/                # ── Subprocesso 6 ── validação pós-build (Build = 5, no código)
│   └── pipeline.md
│
├── bitacora/                       # memória: agêntica + humana (pesquisável)
├── presentaciones/                 # HTML executivo para stakeholders
└── _historia/ · legacy/            # backup (NÃO ler por padrão)
```

> **Sistema de evidências (bibliotecário).** Todo material bruto entra por `_inbox/`; o skill `bibliotecario-evidencia` o identifica, cria sua ficha `EV-NNN` (resumo + achados + onde está cada coisa), arquiva o original na sua pasta de destino e atualiza o `_index.md`. Pesquisar contexto interno = ler índice → fichas → só então o original. Os artefatos (PRDs, OST) citam a sigla `[EV-NNN]`, nunca caminhos.
