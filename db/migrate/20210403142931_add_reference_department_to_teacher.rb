class AddReferenceDepartmentToTeacher < ActiveRecord::Migration[6.1]
  def up
    add_reference :teachers, :department
  end

  def down
    remove_reference :teachers, :department
  end
end
