class CreateBusinessTripCosts < ActiveRecord::Migration[6.1]
  def up
    create_table :business_trip_costs do |t|
      t.references :cost_type
      t.references :payment_request

      # Polymorphic Association
      t.integer :receipt_id
      t.string :receipt_type

      t.integer :amount

      t.timestamps
    end
  end

  def down
    drop_table :business_trip_costs
  end
end
