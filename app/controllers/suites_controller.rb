class SuitesController < ApplicationController

  caches_page :index, :show
  cache_sweeper :resort_sweeper, :only => [:create, :update, :destroy]
  cache_sweeper :suite_sweeper, :only => [:create, :update, :destroy]
  
  before_filter :require_admin, :except => [:show]
  layout "admin_layout"
 
  # GET /suites
  # GET /suites.xml
  def index
    @suites = Suite.all(:include => :resort)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @suites }
    end
  end

  # GET /suites/1
  # GET /suites/1.xml
  def show
    @suite = Suite.find(params[:id])
    @user = User.new
    @booking = Booking.new
    respond_to do |format|
      format.html { render :layout => "application"}
      format.xml  { render :xml => @suite }
    end
  end

  # GET /suites/new
  # GET /suites/new.xml
  def new
    @suite = Suite.new
    @resorts = Resort.all
    @suite.suite_specs.build    ##stores nested attributes into memory holds till parent populates

    respond_to do |format|
      format.html { render :layout => 'admin_layout'}
      format.xml  { render :xml => @suite }
    end
  end

  # GET /suites/1/edit
  def edit
    @suite = Suite.find(params[:id])
    @resorts = Resort.all
    if @suite.suite_specs.blank?
      @suite.suite_specs.build
    end
    
    respond_to do |format|
      format.html
    end
  end

  # POST /suites
  # POST /suites.xml
  def create
    @suite = Suite.new(params[:suite])
    @resorts = Resort.all

    respond_to do |format|
      if @suite.save
        flash[:notice] = 'Suite was successfully created.'
        format.html { redirect_to(@suite) }
        format.xml  { render :xml => @suite, :status => :created, :location => @suite }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @suite.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /suites/1
  # PUT /suites/1.xml
  def update
    @suite = Suite.find(params[:id])
    respond_to do |format|
      if @suite.update_attributes(params[:suite])
        flash[:notice] = 'Suite was successfully updated.'
        format.html { redirect_to(@suite) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @suite.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /suites/1
  # DELETE /suites/1.xml
  def destroy
    @suite = Suite.find(params[:id])
    @suite.destroy

    respond_to do |format|
      format.html { redirect_to(suites_url) }
      format.xml  { head :ok }
    end
  end
end
