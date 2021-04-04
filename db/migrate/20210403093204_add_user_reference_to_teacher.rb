class AddUserReferenceToTeacher < ActiveRecord::Migration[6.1]
  def up
    add_reference :teachers, :user, index: true
  end

  def down
    remove_reference :teachers, :user
  end
end
