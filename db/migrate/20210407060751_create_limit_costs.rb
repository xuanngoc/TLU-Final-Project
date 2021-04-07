class CreateLimitCosts < ActiveRecord::Migration[6.1]
  def up
    create_table :limit_costs do |t|
      t.references :degree_level
      t.references :cost_type
      t.integer :limit
    end
  end

  def down
    drop_table :limit_costs
  end
end
