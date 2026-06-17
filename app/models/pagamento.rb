class Pagamento < ApplicationRecord
  belongs_to :aluno
  belongs_to :atividade_fisica

  after_create :realizar_matricula_automatica

  private

  def realizar_matricula_automatica
    Matricula.create!(
      aluno_id: self.aluno_id, 
      atividade_fisica_id: self.atividade_fisica_id
    )
  end
end