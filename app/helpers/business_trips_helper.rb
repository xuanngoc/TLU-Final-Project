module BusinessTripsHelper

  def exist_payment_request?(bt_id)
    RequestPayment.where(business_trip_id: bt_id).empty?
  end
end
