class AddAttributesToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :address, :string
    add_column :users, :birthday, :date
    add_column :users, :gender, :boolean
    add_column :users, :description, :text
    add_column :users, :tole, :string
  end
end
