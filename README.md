# Sistema Academia 

Sistema web para gestão de uma academia, desenvolvido com **Ruby on Rails 8**. Permite cadastrar alunos, modalidades (atividades físicas) e pagamentos, com **matrícula automática** assim que um pagamento é registrado, além de exportação de relatórios em **PDF** e **CSV**.

##  Funcionalidades

- **Autenticação** de usuários com Devise (login, cadastro, recuperação de senha). Todas as páginas exigem login.
- **Alunos**: CRUD completo (nome, CPF, telefone), com validação de nome obrigatório e CPF obrigatório e único.
- **Atividades físicas**: CRUD de modalidades (nome, descrição, valor da mensalidade) e listagem dos alunos matriculados em cada uma.
- **Pagamentos**: registro vinculando aluno e atividade, com preenchimento automático do valor da mensalidade ao escolher a modalidade.
- **Matrícula automática**: ao salvar um pagamento, o aluno é matriculado na atividade correspondente.
- **Regra de negócio**: uma matrícula só pode existir se o aluno tiver pago pela atividade.
- **Relatórios**: lista de alunos exportável em PDF (Prawn) e CSV.
- **Paginação** da listagem de alunos (Kaminari).
- Endpoints JSON para os recursos (via Jbuilder) e *health check* em `/up`.

##  Tecnologias

| Área | Tecnologia |
|---|---|
| Linguagem | Ruby 3.4.9 |
| Framework | Rails 8.1 |
| Banco de dados | SQLite 3 |
| Autenticação | Devise |
| Paginação | Kaminari |
| PDF | Prawn + prawn-table |
| Front-end | Hotwire (Turbo + Stimulus), Importmap, Propshaft, Bootstrap 5 (CDN) |
| Jobs / Cache / Cable | Solid Queue, Solid Cache, Solid Cable |
| Deploy | Docker, Kamal, Thruster |
| Qualidade | Minitest, RuboCop (omakase), Brakeman, bundler-audit |

##  Modelo de dados

```
Aluno ──< Matricula >── AtividadeFisica
  │                          │
  └────────< Pagamento >─────┘
```

| Tabela | Campos principais |
|---|---|
| `alunos` | `nome`, `cpf`, `telefone` |
| `atividade_fisicas` | `nome`, `descricao`, `valor_mensalidade` |
| `pagamentos` | `aluno_id`, `atividade_fisica_id`, `valor`, `valor_pago`, `data_pagamento` |
| `matriculas` | `aluno_id`, `atividade_fisica_id` |
| `users` | `email`, `encrypted_password` (Devise) |

### Fluxo de negócio

1. Cadastra-se o **aluno** e as **atividades**.
2. Registra-se um **pagamento** para o aluno em uma atividade.
3. O callback `after_create` do `Pagamento` cria a **matrícula** automaticamente.
4. A matrícula só é válida se existir um pagamento do aluno para aquela atividade.

##  Como executar

### Pré-requisitos

- Ruby **3.4.9** (veja `.ruby-version`)
- Bundler
- SQLite 3

### Instalação

```bash
# 1. Clone o repositório
git clone <url-do-repositorio>
cd sistema_academia

# 2. Instale as dependências
bundle install

# 3. Crie o banco, rode as migrations e carregue os dados iniciais
bin/rails db:setup

# 4. Inicie o servidor
bin/rails server
```

Acesse [http://localhost:3000](http://localhost:3000). Na primeira vez, clique em **cadastrar** para criar seu usuário e entrar no sistema.

### Dados iniciais (seeds)

O comando `db:setup` (ou `bin/rails db:seed`) cadastra três modalidades:

| Atividade | Mensalidade |
|---|---|
| Musculação | R$ 100,00 |
| Pilates | R$ 150,00 |
| Zumba | R$ 120,00 |

##  Rotas principais

| Rota | Descrição |
|---|---|
| `/` | Página inicial (lista de alunos) |
| `/alunos` | CRUD de alunos |
| `/alunos.pdf` | Relatório de alunos em PDF |
| `/alunos.csv` | Lista de alunos em CSV |
| `/atividade_fisicas` | CRUD de atividades |
| `/pagamentos` | CRUD de pagamentos |
| `/users/sign_in` | Login |
| `/up` | Health check |

##  Testes e qualidade

```bash
bin/rails test          # testes (Minitest)
bin/rubocop             # análise de estilo
bin/brakeman            # análise de segurança
bin/bundler-audit       # vulnerabilidades em gems
```

##  Deploy

O projeto inclui `Dockerfile` e configuração do [Kamal](https://kamal-deploy.org) (`.kamal/`) para deploy via container. Ajuste `config/deploy.yml` e `.kamal/secrets` com os dados do seu servidor e registry antes de publicar.

##  Estrutura

```
app/
├── controllers/   # Alunos, AtividadeFisicas, Pagamentos
├── models/        # Aluno, AtividadeFisica, Pagamento, Matricula, User
├── pdfs/          # AlunosPdf (relatório em PDF com Prawn)
└── views/         # Telas em ERB + Bootstrap
config/routes.rb   # Rotas
db/                # Migrations, schema e seeds
test/              # Testes automatizados
```

## Autor

Desenvolvido por **<Luiz Fernando>** — [GitHub](https://github.com/Lu1zFern4ndo)
