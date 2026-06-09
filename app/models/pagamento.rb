class Pagamento < ApplicationRecord
  belongs_to :aluno
  belongs_to :atividade_fisica

  validates :data_pagamento, presence: true
  validates :valor_pago, presence: true, numericality: { greater_than: 0 }
end
