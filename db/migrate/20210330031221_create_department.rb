class CreateDepartment < ActiveRecord::Migration[6.1]
  def up
    create_table :departments do |t|
    	t.string :name
    	t.references :head_of_department, foreign_key: { to_table: 'users' }
      
    end
  end
end
