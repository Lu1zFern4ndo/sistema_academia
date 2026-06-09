require 'csv'
class Aluno < ApplicationRecord
  has_many :pagamentos, dependent: :destroy

  validates :nome, presence: true
  validates :cpf, presence: true, uniqueness: true
  def self.to_csv
    atributos = %w{id nome cpf telefone}
      CSV.generate(headers: true) do |csv|
        csv << atributos
          all.each do |aluno|
            csv << atributos.map{ |attr| aluno.send(attr) }
      end
    end
  end
end



