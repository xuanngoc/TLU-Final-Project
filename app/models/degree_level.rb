class DegreeLevel < ApplicationRecord
  after_create :generate_limit_cost


  belongs_to :department
  has_many :limit_costs


  private

  def generate_limit_cost
    CostType.all.each do |cost_type|
      LimitCost.create(degree_level_id: self.id, cost_type_id: cost_type.id, limit: 0)
    end
  end
end
