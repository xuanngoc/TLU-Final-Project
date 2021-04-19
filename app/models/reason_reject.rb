class ReasonReject < ApplicationRecord

  after_create :reset_process_request

  belongs_to :request_payment

  private

  # when any reject acion happend, we need to reset process payment request
  def reset_process_request
    self.request_payment.status = 5
    self.request_payment.save
  end
end
