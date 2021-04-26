class BusinessTrip < ApplicationRecord

  has_many :business_trip_users
  has_many :users, through: :business_trip_users

  has_one :request_payment


  def editable?
    return true if self.request_payment.nil?

    if [
        'Không chấp thuận',
        'Chấp thuận',
        'Đang đợi xác nhận từ bộ phận tài vụ',
        'Đang đợi xác nhận từ trưởng bộ phận tài vụ'
      ].include?(self.request_payment.status)
      false
    else
      true
    end
  end

end
