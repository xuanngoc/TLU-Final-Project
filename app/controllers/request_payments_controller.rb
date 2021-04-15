class RequestPaymentsController < ApplicationController
  before_action :load_business_trip, only: [:index, :new, :create, :edit]
  before_action :load_request_payment, only: [:edit, :update]

  def index
    @request_payment = @business_trip.request_payment

  end

  def list_request_payment
    if params[:status] and params[:status] != 0
      @request_payments = RequestPayment.where(status: params[:status])
    else
      @request_payments = RequestPayment.all
    end
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

  def edit

  end


  def update
    @request_payment.business_trip_costs.destroy_all

    e_receipt_params[:e_receipt].each do |receipt_params|
      reciept = EReceipt.create(receipt_params.except(:cost_type_id))
      BusinessTripCost.create(cost_type_id: receipt_params[:cost_type_id], receipt: reciept, request_payment_id: @request_payment.id)
    end

    redirect_to business_trip_request_payments_path
  end

  private

  def load_business_trip
    @business_trip = BusinessTrip.find(params[:business_trip_id])
  end

  def load_request_payment
    @request_payment = RequestPayment.find(params[:id])
  end

  def e_receipt_params
    params.permit!
  end

end
