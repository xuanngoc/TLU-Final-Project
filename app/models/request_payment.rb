class RequestPayment < ApplicationRecord
  before_create :set_default_status

  belongs_to :business_trip

  belongs_to :user

  has_many :business_trip_costs, dependent: :destroy

  has_many :reason_rejects, dependent: :destroy

  enum status: {
    'Đang đợi xác nhận từ trưởng bộ phận': 0,
    'Đang đợi xác nhận từ bộ phận tài vụ': 1,
    'Đang đợi xác nhận từ trưởng bộ phận tài vụ': 2,
    'Chấp thuận': 3,
    'Không chấp thuận': 4,
    'Tạm bị từ chối': 5
  }


  def total_amount
    total = 0
    if !self.business_trip_costs.empty?
      self.business_trip_costs.each do |cost|
        total += cost.receipt.amount.to_i
      end
    end
    total
  end

  private

  def set_default_status
    if self.status.nil?
      self.status = 0
    end
  end

end
