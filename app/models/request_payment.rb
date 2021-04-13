class RequestPayment < ApplicationRecord
  before_save :set_default_status

  belongs_to :business_trip

  has_many :business_trip_costs, dependent: :destroy

  enum status: {
    'Đang đợi xác nhận từ bộ phận tài vụ': 1,
    'Đang đọi xác nhận từ trưởng bộ phận tài vụ': 2,
    'Không chấp thuận': 3,
    'Chấp thuận': 4
  }

  private

  def set_default_status
    self.status = 1
  end
end
