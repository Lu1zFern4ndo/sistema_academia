class Pagamento < ApplicationRecord
  belongs_to :aluno
  belongs_to :atividade_fisica
end
