class ResortsController < ApplicationController
  
  
  caches_page :show  
  cache_sweeper :resort_sweeper, :only => [:create, :update, :destroy]
  cache_sweeper :resort_location_sweeper, :only => [:create, :update, :destroy]
  cache_sweeper :paradise_sweeper, :only => [:create, :update, :destroy]
  
  before_filter :require_admin, :except => [:show]  
  layout "admin_layout"
  
  # GET /resorts
  # GET /resorts.xml
  def index
    @resorts = Resort.all(:include => :resort_location)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @resorts }
    end
  end

  # GET /resorts/1
  # GET /resorts/1.xml
  def show
    @resort = Resort.find(params[:id])

    respond_to do |format|
      format.html { render :layout => "application"}
      format.xml  { render :xml => @resort }
    end
  end

  # GET /resorts/new
  # GET /resorts/new.xml
  def new
    @resort = Resort.new
    @resort_locations = ResortLocation.all
    @resort.amenities.build    ##stores nested attributes into memory holds till parent populates

    respond_to do |format|
      format.html { render :layout => 'admin_layout'}
      format.xml  { render :xml => @resort }
    end
  end

  # GET /resorts/1/edit
  def edit
    @resort = Resort.find(params[:id])
    @resort_locations = ResortLocation.all
    if @resort.amenities.blank?
      @resort.amenities.build
    end
  end

  # POST /resorts
  # POST /resorts.xml
  def create
    @resort = Resort.new(params[:resort])
    @resort_locations = ResortLocation.all

    respond_to do |format|
      if @resort.save
        flash[:notice] = 'Resort was successfully created.'
        format.html { redirect_to(@resort) }
        format.xml  { render :xml => @resort, :status => :created, :location => @resort }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @resort.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /resorts/1
  # PUT /resorts/1.xml
  def update
    @resort = Resort.find(params[:id])
    respond_to do |format|
      if @resort.update_attributes(params[:resort])
        flash[:notice] = 'Resort was successfully updated.'
        format.html { redirect_to resorts_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @resort.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /resorts/1
  # DELETE /resorts/1.xml
  def destroy
    @resort = Resort.find(params[:id])
    @resort.destroy

    respond_to do |format|
      format.html { redirect_to(resorts_url) }
      format.xml  { head :ok }
    end
  end
end
