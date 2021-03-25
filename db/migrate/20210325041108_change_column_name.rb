class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :tole, :role
  end
end
