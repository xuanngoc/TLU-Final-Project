class RequestPaymentsController < ApplicationController
  before_action :load_business_trip, only: [:index, :new, :create, :edit, :update]
  before_action :load_request_payment, only: [:edit, :update]

  def index
    @request_payment = @business_trip.request_payment
  end

  def show
    @request_payment = RequestPayment.find(params[:id])
  end

  def list_request_payment
    if params[:status] and params[:status] != 0
      @request_payments = RequestPayment.where(status: params[:status])
    else
      @request_payments = RequestPayment.all
    end
  end

  def approve
    request_payment = RequestPayment.find(params[:request_payment_id])

    case request_payment.status
    when 'Đang đợi xác nhận từ bộ phận tài vụ'
      request_payment.status = 2
    when 'Đang đợi xác nhận từ trưởng bộ phận tài vụ'
      request_payment.status = 4
    end
    request_payment.save

    redirect_to list_payment_request_path
  end

  def new
    @request_payment = RequestPayment.new
  end

  def create
    @request_payment = RequestPayment.new(business_trip_id: @business_trip.id)

    if @request_payment.save
      e_receipt_params[:e_receipt].each do |receipt_params|
        reciept = EReceipt.create(receipt_params.except(:cost_type_id, :amount))
        BusinessTripCost.create(
          cost_type_id: receipt_params[:cost_type_id],
          receipt: reciept,
          request_payment_id: @request_payment.id,
          amount: receipt_params[:amount]
        )
      end
    end
    redirect_to business_trip_request_payments_path
  end

  def edit

  end


  def update
    if !validate_limit
      render 'edit'
    else
      @request_payment.business_trip_costs.destroy_all

      e_receipt_params[:e_receipt].each do |receipt_params|
        reciept = EReceipt.create(receipt_params.except(:cost_type_id, :amount))
        BusinessTripCost.create(
          cost_type_id: receipt_params[:cost_type_id],
          receipt: reciept,
          request_payment_id: @request_payment.id,
          amount: receipt_params[:amount]
        )
      end
      @request_payment.update(status: 1)

      redirect_to business_trip_request_payments_path
    end
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

  def validate_limit
    limit_costs = {}
    business_trips_limits = {}

    CostType.all.each do |cost_type|
      limit_costs[cost_type.id] = 0
      business_trips_limits[cost_type.id] = 0
    end

    params[:e_receipt].each do |receipt_params|
      limit_costs[receipt_params[:cost_type_id].to_i] += receipt_params[:amount].to_i
    end

    @business_trip.users.each do |personnel|
      personnel.degree_level.limit_costs.each do |cost|
        business_trips_limits[cost.cost_type_id] += cost.limit
      end
    end

    limit_costs.each do |cost_id, limit|
      if limit_costs[cost_id] > business_trips_limits[cost_id]
        flash[:alert] = "Tổng chi phí #{CostType.find(cost_id).name} vượt quá giới hạn"
      end
    end

    if(flash[:alert])
      false
    else
      true
    end
  end

end
