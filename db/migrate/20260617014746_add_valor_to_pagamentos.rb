class AddValorToPagamentos < ActiveRecord::Migration[8.1]
  def change
    add_column :pagamentos, :valor, :decimal
  end
end
