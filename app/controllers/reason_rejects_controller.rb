class ReasonRejectsController < ApplicationController

  def create
    reason = ReasonReject.new(reason_reject_params)
    if reason.save
      request_payment = RequestPayment.find(reason_reject_params[:request_payment_id])
      request_payment.update(status: 6)

      flash[:notice] = 'Create successful'
    else
      flash[:alert] = 'Create failed'
    end
    redirect_to list_payment_request_path
  end

  private

  def reason_reject_params
    params.require(:reason_reject).permit(
      :reason,
      :request_payment_id
    )
  end

end
