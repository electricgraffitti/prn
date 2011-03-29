class ResortLocationsController < ApplicationController
  
  caches_page :index, :show
  cache_sweeper :resort_location_sweeper, :only => [:create, :update, :destroy]
  cache_sweeper :paradise_sweeper, :only => [:create, :update, :destroy]
  
  before_filter :require_admin, :except => [:index, :show]
  layout "admin_layout"
  
  # GET /resort_locations
  # GET /resort_locations.xml
  def index
    
    if params[:resort_search]
      @resort_locations = ResortLocation.find(params[:resort_search])
    else
      @resort_locations = ResortLocation.find(:all, :include => :resorts)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @resort_locations }
    end
  end

  # GET /resort_locations/1
  # GET /resort_locations/1.xml
  def show
    @resort_location = ResortLocation.find(params[:id])

    respond_to do |format|
      format.html {render :layout => 'landing_page'}
      format.xml  { render :xml => @resort_location }
    end
  end

  # GET /resort_locations/new
  # GET /resort_locations/new.xml
  def new
    @resort_location = ResortLocation.new

    respond_to do |format|
      format.html {render :layout => 'admin_layout'}
      format.xml  { render :xml => @resort_location }
    end
  end

  # GET /resort_locations/1/edit
  def edit
    @resort_location = ResortLocation.find(params[:id])
  end

  # POST /resort_locations
  # POST /resort_locations.xml
  def create
    @resort_location = ResortLocation.new(params[:resort_location])

    respond_to do |format|
      if @resort_location.save
        flash[:notice] = 'ResortLocation was successfully created.'
        format.html { redirect_to admins_path }
        format.xml  { render :xml => @resort_location, :status => :created, :location => @resort_location }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @resort_location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /resort_locations/1
  # PUT /resort_locations/1.xml
  def update
    @resort_location = ResortLocation.find(params[:id])
    respond_to do |format|
      if @resort_location.update_attributes(params[:resort_location])
        flash[:notice] = 'ResortLocation was successfully updated.'
        format.html { redirect_to admins_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @resort_location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /resort_locations/1
  # DELETE /resort_locations/1.xml
  def destroy
    @resort_location = ResortLocation.find(params[:id])
    @resort_location.destroy

    respond_to do |format|
      format.html { redirect_to(resort_locations_url) }
      format.xml  { head :ok }
    end
  end
end
