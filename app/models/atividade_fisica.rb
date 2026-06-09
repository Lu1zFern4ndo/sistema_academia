class AtividadeFisica < ApplicationRecord
  has_many :pagamentos, dependent: :destroy

  validates :nome, presence: true
  validates :valor_mensalidade, presence: true, numericality: { greater_than: 0 }
end
