class BusinessTripUser < ApplicationRecord
  belongs_to :user
  belongs_to :business_trip
end
