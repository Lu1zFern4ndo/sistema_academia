class Aluno < ApplicationRecord
  has_many :pagamentos, dependent: :destroy

  validates :nome, presence: true
  validates :cpf, presence: true, uniqueness: true
end
