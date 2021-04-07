class AddAttributesToUser < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :role, :integer
    add_column :users, :full_name, :string
    add_column :users, :gender, :boolean
    add_column :users, :address, :string
    add_column :users, :birthday, :date
  end

  def down
    add_column :users, :role
    add_column :users, :full_name
    add_column :users, :gender
    add_column :users, :address
    add_column :users, :birthday
  end
end
