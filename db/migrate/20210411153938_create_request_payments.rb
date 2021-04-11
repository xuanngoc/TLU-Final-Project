class CreateRequestPayments < ActiveRecord::Migration[6.1]
  def up
    create_table :request_payments do |t|
      t.references :business_trip
      t.string :status

      t.integer :total_amount

      t.timestamps
    end
  end

  def down
    drop_table :request_payments
  end
end
