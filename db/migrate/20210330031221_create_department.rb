class CreateDepartment < ActiveRecord::Migration[6.1]
  def up
    create_table :departments do |t|
    	t.string :name
    	t.string :code
    end
  end

  def down
    drop_table :departments
  end
end
