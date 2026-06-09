json.extract! pagamento, :id, :data_pagamento, :valor_pago, :aluno_id, :atividade_fisica_id, :created_at, :updated_at
json.url pagamento_url(pagamento, format: :json)
