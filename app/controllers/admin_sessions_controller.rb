class AdminSessionsController < ApplicationController

  # GET /admin_sessions/new
  # GET /admin_sessions/new.xml
  def new
    @admin_session = AdminSession.new
    respond_to do |format|
      format.html { render :layout => "admin_layout"}
      format.xml  { render :xml => @admin_session }
    end
  end

  # POST /admin_sessions
  # POST /admin_sessions.xml
  def create
    @admin_session = AdminSession.new(params[:admin_session])
      if @admin_session.save
        flash[:notice] = 'Login Successfull'
        redirect_to admins_path
      else
        flash[:notice] = 'Login Failed! Please retry'
        render :action => 'new'
      end
  end
  # DELETE /admin_sessions/1
  # DELETE /admin_sessions/1.xml
  def destroy
    @admin_session = AdminSession.find(current_admin)
    @admin_session.destroy
    flash[:notice] = 'Logout Successfull'
    redirect_to root_path
  end
  
end
