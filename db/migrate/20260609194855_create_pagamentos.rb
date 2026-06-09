class CreatePagamentos < ActiveRecord::Migration[8.1]
  def change
    create_table :pagamentos do |t|
      t.date :data_pagamento
      t.decimal :valor_pago
      t.references :aluno, null: false, foreign_key: true
      t.references :atividade_fisica, null: false, foreign_key: true

      t.timestamps
    end
  end
end
