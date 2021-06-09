class ReportRequestPaymentsController < ApplicationController
  before_action :load_request_payment, only: [:show]

  def index
    @request_payments = RequestPayment.where(id: ability_request_payment_ids)
    if params[:from_date].present?
      from_date = Date.parse(params[:from_date])
      if params[:to_date].present?
        to_date = Date.parse(params[:to_date])
        @business_trip = BusinessTrip.where(from_date: from_date..to_date)
      else
        @business_trip = BusinessTrip.where(from_date: from_date..Date.today)
      end
      @request_payments = RequestPayment.where(business_trip: @business_trip)
    end

    if params[:status].present?
      @request_payments = @request_payments.where(status: params[:status])
    end

    if params[:department].present?
      users = User.where(degree_level: DegreeLevel.where(department_id: params[:department]))
      @request_payments = @request_payments.where(user: users)
    end
  end

  def show

  end


  private

  def load_request_payment
    @request_payment = RequestPayment.find(params[:id])
  end
end
