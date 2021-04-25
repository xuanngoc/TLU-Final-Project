class Department < ApplicationRecord

  has_many :degree_levels, dependent: :destroy

  belongs_to :head_of_department, class_name: "user"
end
