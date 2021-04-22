class AddCreatorInRequestPayment < ActiveRecord::Migration[6.1]
  def up
    add_reference :request_payments, :user, foreign_key: true
  end

  def down

  end
end
