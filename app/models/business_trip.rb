class BusinessTrip < ApplicationRecord
  has_many :costs, class_name: "cost", foreign_key: "cost_id"
end
