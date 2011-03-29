class ParadiseController < ApplicationController
  
  caches_page :index
  protect_from_forgery :except => [:index]
  
  def index
    @resorts = Resort.all
    @resort_locations = ResortLocation.all
    @user = User.new
    if current_user
      @booking = Booking.user_bookings(current_user.id).last
      @payment_notification = PaymentNotification.find_by_booking_id(@booking.id) unless @booking.nil?
    end
  end

end
