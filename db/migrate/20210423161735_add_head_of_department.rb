class AddHeadOfDepartment < ActiveRecord::Migration[6.1]
  def up
    add_reference :departments, :user, foreign_key: true
  end

  def down
    remove_column :departments, :user_id
  end
end
