class ChangeTypePurposeColumnBusinessTrip < ActiveRecord::Migration[6.1]
  def up
    change_column :business_trips, :purpose, :text
  end
end
