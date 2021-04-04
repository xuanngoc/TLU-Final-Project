class Department < ApplicationRecord

  has_many :teachers

  belongs_to :head_of_department, class_name: "Teacher", foreign_key: "teacher_id", optional: true

end
