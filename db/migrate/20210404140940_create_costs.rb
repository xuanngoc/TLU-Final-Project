class CreateCosts < ActiveRecord::Migration[6.1]
  def up
    create_table :costs do |t|
      t.string :type
      t.string :amount
      t.references :business_trips
      t.datetime :at
    end
  end

  def down
    drop_table :costs
  end
end
