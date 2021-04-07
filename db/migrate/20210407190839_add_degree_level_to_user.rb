class AddDegreeLevelToUser < ActiveRecord::Migration[6.1]
  def up
    add_reference :users, :degree_level
  end

  def down
    remove_reference :users, :degree_level
  end
end
