json.extract! aluno, :id, :nome, :cpf, :telefone, :created_at, :updated_at
json.url aluno_url(aluno, format: :json)
