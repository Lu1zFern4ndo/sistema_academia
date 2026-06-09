class CreateAtividadeFisicas < ActiveRecord::Migration[8.1]
  def change
    create_table :atividade_fisicas do |t|
      t.string :nome
      t.text :descricao
      t.decimal :valor_mensalidade

      t.timestamps
    end
  end
end
