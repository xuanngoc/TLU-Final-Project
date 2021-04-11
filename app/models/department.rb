class Department < ApplicationRecord

  has_many :degree_levels, dependent: :destroy

end
