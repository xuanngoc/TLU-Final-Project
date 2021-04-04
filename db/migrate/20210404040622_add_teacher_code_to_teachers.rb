class AddTeacherCodeToTeachers < ActiveRecord::Migration[6.1]
  def up
    add_column :teachers, :code, :string
  end

  def down
    remove_column :teachers, :code
  end
end
