class BusinessTrip < ApplicationRecord

  has_many :business_trip_users
  has_many :users, through: :business_trip_users

  has_one :request_payment

end
