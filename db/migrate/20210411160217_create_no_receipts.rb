class CreateNoReceipts < ActiveRecord::Migration[6.1]
  def up
    create_table :no_receipts do |t|

      t.references :business_trip_cost
      t.timestamps
    end
  end

  def down
    drop_table :no_receipts
  end
end
