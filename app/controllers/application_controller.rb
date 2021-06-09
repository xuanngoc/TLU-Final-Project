class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pagy::Frontend


  protect_from_forgery with: :exception

  before_action :authenticate_user!

  private

  def belong_business_trip(business_trip)
    business_trip.users.include?(current_user)
  end

  def request_payment_ids_by_department
    return RequestPayment.all.pluck(:id) if current_user.admin? || current_user.financial_department?
    return [] if !Department.all.pluck(:user_id).include?(current_user.id)

    users = User.where(degree_level: DegreeLevel.where(department_id: current_user.department))
    request_payment_ids = RequestPayment.where(user: users).pluck(:id)

  end

  def ability_request_payment_ids
    business_trips = BusinessTrip.all
    business_trip_ids = []

    business_trips.each do |bt|
      business_trip_ids << bt.id if belong_business_trip(bt)
    end

    request_payment_ids = RequestPayment.where(business_trip_id: business_trip_ids)

    return request_payment_ids_by_department + request_payment_ids
  end

end
