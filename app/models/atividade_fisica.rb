class AtividadeFisica < ApplicationRecord
  has_many :pagamentos, dependent: :destroy
  
  has_many :matriculas, dependent: :destroy
end