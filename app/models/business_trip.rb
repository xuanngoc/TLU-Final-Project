class BusinessTrip < ApplicationRecord

  has_many :business_trip_users
  has_many :users, through: :business_trip_users

  has_one :request_payment


  def editable?
    return true if self.request_payment.nil?

    return true if ['Tạm bị từ chối', 'Đang đợi xác nhận từ trưởng bộ phận'].include?(self.request_payment.status)

    return false
  end

end
