class CreateDegreeEmployees < ActiveRecord::Migration[6.1]
  def up
    create_table :degree_employees do |t|
      t.string :type
      t.string :name
    end
  end

  def down
    drop_table :degree_employees
  end
end
