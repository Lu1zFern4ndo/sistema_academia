class CreateAlunos < ActiveRecord::Migration[8.1]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.string :cpf
      t.string :telefone

      t.timestamps
    end
  end
end
