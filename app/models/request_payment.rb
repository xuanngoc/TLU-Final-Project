class RequestPayment < ApplicationRecord
  before_create :set_default_status

  belongs_to :business_trip

  has_many :business_trip_costs, dependent: :destroy

  has_many :reason_rejects, dependent: :destroy

  enum status: {
    'Đang đợi xác nhận từ bộ phận tài vụ': 1,
    'Đang đợi xác nhận từ trưởng bộ phận tài vụ': 2,
    'Không chấp thuận': 3,
    'Chấp thuận': 4,
    'Tạm bị từ chối': 5
  }

  private

  def set_default_status
    if self.status.nil?
      self.status = 1
    end
  end

end
