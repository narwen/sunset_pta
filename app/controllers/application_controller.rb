class ApplicationController < ActionController::Base
  helper_method :current_user_session, :current_user, :access_denied
  filter_parameter_logging :password, :password_confirmation

rescue_from 'Acl9::AccessDenied', :with => :cannot_do_that
  private

  def access_denied
    flash[:notice] = "You do not have permission to do that"
    redirect_to root_path
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def cannot_do_that
    flash[:notice] = "Permission Denied!"
    redirect_to root_path
  end
  
end
