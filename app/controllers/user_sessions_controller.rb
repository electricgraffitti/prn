class UserSessionsController < ApplicationController

    # GET /user_session/new
    # GET /user_session/new.xml
    def new
      @user_session = UserSession.new
      respond_to do |format|
        format.html { render :layout => "admin_layout"}
        format.xml  { render :xml => @user_session }
      end
    end

    # POST /user_sessions
    # POST /user_sessions.xml
    def create
      @user_session = UserSession.new(params[:user_session])
        if @user_session.save
          flash[:notice] = 'Login Successfull'
          redirect_to root_path
        else
          flash[:notice] = 'Login Failed! Please retry'
          render :action => 'new'
        end
    end
    # DELETE /user_sessions/1
    # DELETE /user_sessions/1.xml
    def destroy
      @user_session = UserSession.find(current_user)
      @user_session.destroy
      flash[:notice] = 'Logout Successfull'
      redirect_to root_path
    end
end
