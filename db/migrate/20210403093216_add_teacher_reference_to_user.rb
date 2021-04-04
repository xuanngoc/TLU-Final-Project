class AddTeacherReferenceToUser < ActiveRecord::Migration[6.1]
  def up
    add_reference :users, :teacher
  end
  def down
    remove_reference :users, :teacher
  end
end
