class CreateCostTypes < ActiveRecord::Migration[6.1]
  def up
    create_table :cost_types do |t|
      t.string :name
    end
  end

  def down
    drop_table :cost_types
  end
end
