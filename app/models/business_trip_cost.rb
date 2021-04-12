class BusinessTripCost < ApplicationRecord

  belongs_to :receipt, polymorphic: true, optional: true
  belongs_to :cost_type, optional: true

end
