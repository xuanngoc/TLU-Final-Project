class RequestPaymentsController < ApplicationController
  before_action :load_business_trip, only: [:index, :new, :create, :show, :update]

  def index
    @request_payment = @business_trip.request_payment

  end

  def show

  end

  def new
    @request_payment = RequestPayment.new
  end

  def create
    @request_payment = RequestPayment.new(business_trip_id: @business_trip.id)

    if @request_payment.save
      e_receipt_params.each do |key, receipt_params|
        reciept = EReceipt.create(receipt_params.except(:cost_type_id))
        BusinessTripCost.create(cost_type_id: receipt_params[:cost_type_id], receipt: reciept, request_payment_id: @request_payment.id)
      end
    end
    redirect_to business_trip_request_payments_path
  end

  private

  def load_business_trip
    @business_trip = BusinessTrip.find(params[:business_trip_id])
  end

  def load_request_payment

  end

  def e_receipt_params
    params.require(:e_receipt).permit!
  end

end
