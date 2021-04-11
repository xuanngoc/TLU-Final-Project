class RequestPaymentsController < ApplicationController

  def index

  end

  def show

  end

  def new
    @business_trip = BusinessTrip.first
    @request_payment = RequestPayment.new
  end
end
