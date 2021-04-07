class CreateDegreeLevels < ActiveRecord::Migration[6.1]
  def up
    create_table :degree_levels do |t|
      t.string :name
      t.text :description

      t.references :department
    end
  end

  def down
    drop_table :degree_levels
  end
end
