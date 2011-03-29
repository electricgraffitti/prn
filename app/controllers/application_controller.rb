# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  before_filter :mailer_set_url_options
 
 
  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  helper_method :current_admin_session, :current_admin, :require_admin, :current_user_session, :current_user, :super?, :super_admin

   private
   
     def current_user_session
       return @current_user_session if defined?(@current_user_session)
       @current_user_session = UserSession.find
     end

     def current_user
       return @current_user if defined?(@current_user)
       @current_user = current_user_session && current_user_session.user
     end
  
     def require_user
       unless current_user
         store_location
         flash[:notice] = "You must be logged in to access this page"
         redirect_to new_user_session_url
         return false
       end
     end

     def require_no_user
       if current_admin
         store_location
         flash[:notice] = "You must be logged out to access this page"
         redirect_to account_url
         return false
       end
     end
   
     def current_admin_session
       return @current_admin_session if defined?(@current_admin_session)
       @current_admin_session = AdminSession.find
     end

     def current_admin
       return @current_admin if defined?(@current_admin)
       @current_admin = current_admin_session && current_admin_session.admin
     end
    
     def require_admin
       unless current_admin
         store_location
         flash[:notice] = "You must be logged in to access this page"
         redirect_to new_admin_session_url
         return false
       end
     end

     def require_no_admin
       if current_admin
         store_location
         flash[:notice] = "You must be logged out to access this page"
         redirect_to account_url
         return false
       end
     end

     def store_location
       session[:return_to] = request.request_uri
     end

     def redirect_back_or_default(default)
       redirect_to(session[:return_to] || default)
       session[:return_to] = nil
     end
     
     protected
     
     def super_admin
      unless super? 
        return false
      end
     end
     
     def super?
       authenticate_or_request_with_http_basic do |username, password|
         username == APP['username'] && password == APP['password']
       end
     end
end
