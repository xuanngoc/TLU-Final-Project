class AddCodeToUser < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :code, :string
  end

  def down
    remove_column :users, :code
  end
end
