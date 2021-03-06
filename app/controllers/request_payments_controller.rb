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
    @request_payments = RequestPayment.where(id: ability_request_payment_ids)

    if params[:status].present?
      @request_payments = @request_payments.where(status: params[:status])
    end
  end

  def approve
    request_payment = RequestPayment.find(params[:request_payment_id])

    case request_payment.status
    when 'Đang đợi xác nhận từ trưởng bộ phận'
      request_payment.status = 1
    when 'Đang đợi xác nhận từ bộ phận tài vụ'
      request_payment.status = 2
    when 'Đang đợi xác nhận từ trưởng bộ phận tài vụ'
      request_payment.status = 3
    when 'Đã chấp thuận, chờ thực hiện thanh toán'
      request_payment.status = 4
    end

    request_payment.save

    flash[:notice] = 'Duyệt đơn thành công'

    redirect_to list_payment_request_path
  end

  def new
    @request_payment = RequestPayment.new
  end

  def create
    @request_payment = RequestPayment.new(business_trip: @business_trip, user: current_user)

    if @request_payment.save
      if e_receipt_params[:e_receipt].present?
        e_receipt_params[:e_receipt].each do |receipt_params|
          reciept = EReceipt.create(receipt_params.except(:cost_type_id))
          BusinessTripCost.create(
            cost_type_id: receipt_params[:cost_type_id],
            receipt: reciept,
            request_payment_id: @request_payment.id,
            # amount: receipt_params[:amount]
          )
        end
      end

      if no_receipt_params[:no_receipt].present?
        no_receipt_params[:no_receipt].each do |receipt_params|
          reciept = NoReceipt.create(receipt_params.except(:cost_type_id))
          BusinessTripCost.create(
            cost_type_id: receipt_params[:cost_type_id],
            receipt: reciept,
            request_payment_id: @request_payment.id,
            # amount: receipt_params[:amount]
          )
        end
      end
    end

    flash[:notice] = 'Đã tạo yêu cầu thành công, vui lòng đợi'

    redirect_to business_trip_request_payments_path
  end

  def edit

  end


  def update
    if !validate_limit
      render 'edit'
    else
      @request_payment.business_trip_costs.destroy_all

      if e_receipt_params[:e_receipt].present?
        e_receipt_params[:e_receipt].each do |receipt_params|
          reciept = EReceipt.create(receipt_params.except(:cost_type_id))
          BusinessTripCost.create(
            cost_type_id: receipt_params[:cost_type_id],
            receipt: reciept,
            request_payment_id: @request_payment.id,
            # amount: receipt_params[:amount]
          )
        end
      end

      if no_receipt_params[:no_receipt].present?
        no_receipt_params[:no_receipt].each do |receipt_params|
          reciept = NoReceipt.create(receipt_params.except(:cost_type_id))
          BusinessTripCost.create(
            cost_type_id: receipt_params[:cost_type_id],
            receipt: reciept,
            request_payment_id: @request_payment.id,
            # amount: receipt_params[:amount]
          )
        end
      end

      @request_payment.update(status: 0)

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

  def no_receipt_params
    params.permit!
  end

  def validate_limit
    limit_costs = {}
    business_trips_limits = {}

    CostType.all.each do |cost_type|
      limit_costs[cost_type.id] = 0
      business_trips_limits[cost_type.id] = 0
    end

    if params[:e_receipt].present?
      params[:e_receipt].each do |receipt_params|
        limit_costs[receipt_params[:cost_type_id].to_i] += receipt_params[:amount].to_i
      end
    end

    if params[:no_receipt].present?
      params[:no_receipt].each do |receipt_params|
        limit_costs[receipt_params[:cost_type_id].to_i] += receipt_params[:amount].to_i
      end
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
