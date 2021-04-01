class AddColumnCodeDepartment < ActiveRecord::Migration[6.1]
  def up
    add_column :departments, :code, :string
  end

  def down
    remove_column :departments, :code
  end
end
