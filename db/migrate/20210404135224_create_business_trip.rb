class CreateBusinessTrip < ActiveRecord::Migration[6.1]
  def up
    create_table :business_trips do |t|
      t.references :teacher
      t.string :destination
      t.date :from_date
      t.date :to_date
      t.integer :purpose
      t.integer :status

      t.timestamps
    end
  end

  def down
    drop_table :business_trips
  end
end
