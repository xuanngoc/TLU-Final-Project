class NoReceipt < ApplicationRecord

  has_one :business_trip_cost, as: :receipt

end
