class AddColumnsToDepartment < ActiveRecord::Migration[6.1]
  def up
    add_reference :departments, :teacher, index: true
  end
  def down
    remove_reference :departments, :teacher
  end
end
