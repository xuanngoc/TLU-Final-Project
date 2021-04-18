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
      create_business_trip_personnel
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
      update_business_trip_personnel
      flash[:notice] = 'Update successful'
    else
      flash[:error] = 'Update failed'
    end
    redirect_to business_trips_path
  end

  def destroy
    @business_trip.destroy
    redirect_to business_trips_path
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

  def list_perssonel_params
    params.require(:list_personnel)
  end

  def find_business_trip
    @business_trip = BusinessTrip.find(params[:id])
  end

  def create_business_trip_personnel
    list_perssonel_params.each do |id|
      BusinessTripUser.create(business_trip_id: @business_trip.id, user_id: id)
    end
  end

  def update_business_trip_personnel
    BusinessTripUser.where(business_trip_id: @business_trip.id).destroy_all
    list_perssonel_params.each do |id|
      BusinessTripUser.create(business_trip_id: @business_trip.id, user_id: id)
    end
  end
end
