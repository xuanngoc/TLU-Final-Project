class Department < ApplicationRecord

  has_many :users

  # belongs_to :head_of_department, class_name: "User", foreign_key: "user_id", optional: true

  has_many :degree_levels, class_name: "degree_level"
end
