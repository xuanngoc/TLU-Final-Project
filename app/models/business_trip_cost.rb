class BusinessTripCost < ApplicationRecord

  belongs_to :receipt, polymorphic: true, optional: true

end
