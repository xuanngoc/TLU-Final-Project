class LimitCostBlueprint < Blueprinter::Base
  identifier :id

  view :normal do
    fields :limit
    association :cost_type,  blueprint: CostTypeBlueprint
  end

end
