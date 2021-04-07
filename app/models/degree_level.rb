class DegreeLevel < ApplicationRecord

  belongs_to :department
  has_many :limit_costs

end
