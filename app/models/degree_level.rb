class DegreeLevel < ApplicationRecord
  after_create :generate_limit_cost


  belongs_to :department, class_name: "department", foreign_key: "department_id"

  has_many :limit_costs

  has_many :users


  private

  def generate_limit_cost
    CostType.all.each do |cost_type|
      LimitCost.create(degree_level_id: self.id, cost_type_id: cost_type.id, limit: 0)
    end
  end
end
