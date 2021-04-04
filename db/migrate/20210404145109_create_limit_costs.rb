class CreateLimitCosts < ActiveRecord::Migration[6.1]
  def up
    create_table :limit_costs do |t|
      t.references :degree_employees
      t.integer :limit
      t.integer :cost_type
    end
  end

  def down
    drop_table :limit_costs
  end
end
