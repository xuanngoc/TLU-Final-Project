class CreateBusinessTrips < ActiveRecord::Migration[6.1]
  def up
    create_table :business_trips do |t|
      t.string :destination
      t.string :purpose
      t.date :from_date
      t.date :to_date
      t.string :decision_writing
      t.string :status
    end
  end

  def down
    drop_table :business_trips
  end
end
