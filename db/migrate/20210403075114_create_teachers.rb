class CreateTeachers < ActiveRecord::Migration[6.1]
  def up
    create_table :teachers do |t|
      t.string :full_name
      t.string :address
      t.boolean :gender
      t.date :birthday
      t.integer :academic_levels
    end
  end

  def down
    drop_table :teachers
  end
end
