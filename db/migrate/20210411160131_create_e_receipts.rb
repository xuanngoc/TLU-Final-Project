class CreateEReceipts < ActiveRecord::Migration[6.1]
  def up
    create_table :e_receipts do |t|
      t.string :tax_number
      t.string :template_number
      t.string :symbols
      t.string :receipt_number
      t.string :amount

      t.references :business_trip_cost

      t.timestamps
    end
  end

  def down
    drop_table :e_receipts
  end
end
