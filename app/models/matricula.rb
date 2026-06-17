class Matricula < ApplicationRecord
  belongs_to :aluno
  belongs_to :atividade_fisica

  
  validate :aluno_deve_ter_pago_a_atividade

  private

  def aluno_deve_ter_pago_a_atividade
    pagamento_confirmado = Pagamento.exists?(aluno_id: aluno_id, atividade_fisica_id: atividade_fisica_id)

    unless pagamento_confirmado
      errors.add(:base, "Matrícula bloqueada: O aluno precisa pagar por esta atividade antes de se matricular.")
    end
  end
end