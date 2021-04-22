class AddAttributesToNoReciept < ActiveRecord::Migration[6.1]
  def up
    add_column :no_receipts, :amount, :string
  end

  def down
    remove_column :no_receipts, :amount
  end
end
