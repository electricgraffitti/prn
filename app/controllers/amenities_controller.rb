class AmenitiesController < ApplicationController
  
  caches_page :index, :show  
  cache_sweeper :amenity_sweeper, :only => [:create, :update, :destroy]
  cache_sweeper :resort_sweeper, :only => [:create, :update, :destroy]
  
  before_filter :require_admin
  
  # GET /amenities
  # GET /amenities.xml
  def index
    @amenities = Amenity.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @amenities }
    end
  end

  # GET /amenities/1
  # GET /amenities/1.xml
  def show
    @amenity = Amenity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @amenity }
    end
  end

  # GET /amenities/new
  # GET /amenities/new.xml
  def new
    @amenity = Amenity.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @amenity }
    end
  end

  # GET /amenities/1/edit
  def edit
    @amenity = Amenity.find(params[:id])
  end

  # POST /amenities
  # POST /amenities.xml
  def create
    @amenity = Amenity.new(params[:amenity])

    respond_to do |format|
      if @amenity.save
        flash[:notice] = 'Amenity was successfully created.'
        format.html { redirect_to(@amenity) }
        format.xml  { render :xml => @amenity, :status => :created, :location => @amenity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @amenity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /amenities/1
  # PUT /amenities/1.xml
  def update
    @amenity = Amenity.find(params[:id])

    respond_to do |format|
      if @amenity.update_attributes(params[:amenity])
        flash[:notice] = 'Amenity was successfully updated.'
        format.html { redirect_to(@amenity) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @amenity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /amenities/1
  # DELETE /amenities/1.xml
  def destroy
    @amenity = Amenity.find(params[:id])
    @amenity.destroy

    respond_to do |format|
      format.html { redirect_to(amenities_url) }
      format.xml  { head :ok }
    end
  end
end
