class ApplicationMailer < ActionMailer::Base
  
  def new_booking_mailer(params, user)
    
    # need to parse the params
    @user = user
    @admin = Admin.first
    @suite = Suite.find(params[:booking][:suite_id])
    @sent_on = Time.now
    
    # This is what gets set in the mailer
    recipients    @admin.email
    from          "Paradise Resorts Now.com - #{@user.fullname}"
    subject       "New Booking: #{@suite.suite_name}"
    body          :params => params, :user => @user, :admin => @admin, :suite => @suite
    
  end
  
  def update_booking_mailer(params, booking, user, price)
    @booking = booking
    # This is what gets set in the mailer
    recipients    user.username
    from          "Paradise Resorts Now.com"
    if @booking.cancelled == true 
      subject       "Booking Canceled - ParadiseResortsNow: #{@booking.suite.suite_name}"
    else
      subject       "Booking Approved - ParadiseResortsNow: #{@booking.suite.suite_name}"
    end
    body          :params => params, :user => user, :booking => @booking, :price => price
    
  end

end
