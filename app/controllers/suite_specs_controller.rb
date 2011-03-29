class SuiteSpecsController < ApplicationController
  
  caches_page :index, :show
  cache_sweeper :suite_spec_sweeper, :only => [:create, :update, :destroy]
  cache_sweeper :suite_sweeper, :only => [:create, :update, :destroy]
  
  before_filter :require_admin
  
  
  # GET /suite_specs
  # GET /suite_specs.xml
  def index
    @suite_specs = SuiteSpec.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @suite_specs }
    end
  end

  # GET /suite_specs/1
  # GET /suite_specs/1.xml
  def show
    @suite_spec = SuiteSpec.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @suite_spec }
    end
  end

  # GET /suite_specs/new
  # GET /suite_specs/new.xml
  def new
    @suite_spec = SuiteSpec.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @suite_spec }
    end
  end

  # GET /suite_specs/1/edit
  def edit
    @suite_spec = SuiteSpec.find(params[:id])
  end

  # POST /suite_specs
  # POST /suite_specs.xml
  def create
    @suite_spec = SuiteSpec.new(params[:suite_spec])

    respond_to do |format|
      if @suite_spec.save
        flash[:notice] = 'SuiteSpec was successfully created.'
        format.html { redirect_to(@suite_spec) }
        format.xml  { render :xml => @suite_spec, :status => :created, :location => @suite_spec }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @suite_spec.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /suite_specs/1
  # PUT /suite_specs/1.xml
  def update
    @suite_spec = SuiteSpec.find(params[:id])

    respond_to do |format|
      if @suite_spec.update_attributes(params[:suite_spec])
        flash[:notice] = 'SuiteSpec was successfully updated.'
        format.html { redirect_to(@suite_spec) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @suite_spec.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /suite_specs/1
  # DELETE /suite_specs/1.xml
  def destroy
    @suite_spec = SuiteSpec.find(params[:id])
    @suite_spec.destroy

    respond_to do |format|
      format.html { redirect_to(suite_specs_url) }
      format.xml  { head :ok }
    end
  end
end
