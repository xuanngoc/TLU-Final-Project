class BusinessTripsController < ApplicationController
  before_action :find_business_trip, only: [:edit, :update, :show, :destroy]

  def index
    @business_trips = BusinessTrip.all
  end

  def new
    @business_trip = BusinessTrip.new
  end

  def create
    @business_trip = BusinessTrip.new(business_trip_params)
    if @business_trip.save
      flash[:notice] = 'Create successful'
    else
      flash[:error] = 'Create failed'
    end
    redirect_to business_trips_path
  end

  def edit
  end

  def show
  end

  def update
    if @business_trip.update(business_trip_params)
      flash[:notice] = 'Update successful'
    else
      flash[:error] = 'Update failed'
    end
    redirect_to business_trips_path
  end

  def destroy
  end

  private

  def business_trip_params
    params.require(:business_trip).permit(
      :destination,
      :from_date,
      :to_date,
      :purpose,
      :decision_writing
    )
  end

  def find_business_trip
    @business_trip = BusinessTrip.find(params[:id])
  end
end
