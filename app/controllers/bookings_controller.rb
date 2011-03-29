class BookingsController < ApplicationController
  
  before_filter :require_admin, :only => [:index, :update, :edit]
  before_filter :require_user, :only => [:show, :create]
  
  # GET /bookings
  # GET /bookings.xml
  def index
    @bookings = Booking.all(:include => [:user, :suite])
    @current_bookings = Booking.current_bookings
    @archived_bookings = Booking.archived_bookings
    @cancelled_bookings = Booking.cancelled_bookings

    respond_to do |format|
      format.html { render :layout => "admin_layout"}
      format.xml  { render :xml => @bookings }
    end
  end

  # GET /bookings/1
  # GET /bookings/1.xml
  def show
    @booking = Booking.find(params[:id])
    
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @booking }
    end
  end

  # GET /bookings/new
  # GET /bookings/new.xml
  def new
    @booking = Booking.new
    @suite = Suite.find(params[:suite_id])
    respond_to do |format|
      format.html { render :layout => 'admin_layout'}
      format.xml  { render :xml => @booking }
    end
  end

  # GET /bookings/1/edit
  def edit
    @booking = Booking.find(params[:id])
    
    respond_to do |format|
      format.html { render :layout => "admin_layout"}
    end
  end

  # POST /bookings
  # POST /bookings.xml
  def create
    @user = current_user
    @form = params
    @booking = Booking.new(params[:booking])
    @suite = Suite.find(params[:booking][:suite_id])
    booking = ApplicationMailer.create_new_booking_mailer(params, current_user)
    booking.set_content_type("text/html")
    respond_to do |format|
      if @booking.save
        ApplicationMailer.deliver(booking)
        flash[:notice] = 'Booking was successfully created.'

        format.html { redirect_to @booking }
        format.xml  { render :xml => @booking, :status => :created, :location => @booking }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @booking.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bookings/1
  # PUT /bookings/1.xml
  def update
    @booking = Booking.find(params[:id])
    @user = @booking.user
    @price = params[:booking][:price]

    respond_to do |format|
      if @booking.update_attributes(params[:booking])
          booking_update = ApplicationMailer.create_update_booking_mailer(params, @booking, @user, @price)
          booking_update.set_content_type("text/html")
          ApplicationMailer.deliver(booking_update)
        flash[:notice] = 'Booking was successfully updated.'
        format.html { redirect_to bookings_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @booking.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.xml
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to(bookings_url) }
      format.xml  { head :ok }
    end
  end
end
