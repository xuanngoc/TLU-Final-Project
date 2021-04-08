class CreateBusinessTripUsers < ActiveRecord::Migration[6.1]
  def up
    create_table :business_trip_users do |t|
      t.references :business_trip
      t.references :user
    end
  end

  def down
    drop_table :business_trip_users
  end
end
