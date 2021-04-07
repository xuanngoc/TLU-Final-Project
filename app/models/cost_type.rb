class CostType < ApplicationRecord
  after_create :generate_limit_cost

  has_many :limit_costs, dependent: :destroy

  private

  def generate_limit_cost
    DegreeLevel.all.each do |degree|
      LimitCost.create(degree_level_id: degree.id, cost_type_id: self.id, limit: 0)
    end
  end
end
