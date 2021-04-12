class ChangeStatusDataType < ActiveRecord::Migration[6.1]
  def up
    remove_column :request_payments, :status
    add_column :request_payments, :status, :integer
  end

  def down
    remove_column :request_payments, :status
    add_column :request_payments, :status, :string
  end
end
