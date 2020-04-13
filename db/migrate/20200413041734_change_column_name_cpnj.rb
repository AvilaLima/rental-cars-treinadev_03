class ChangeColumnNameCpnj < ActiveRecord::Migration[6.0]
  def change
    rename_column :subsidiaries, :cpnj, :cnpj
  end
end
