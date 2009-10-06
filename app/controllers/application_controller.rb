class ApplicationController < ActionController::Base
  helper_method :current_user_session, :current_user, :access_denied, :require_no_user, :show_positions?, :fetch_secret_password
  filter_parameter_logging :password, :password_confirmation

  rescue_from 'Acl9::AccessDenied', :with => :cannot_do_that

  private

  def fetch_secret_password
    "hellocharlie"
  end

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
    redirect_to login_url
  end

  def require_no_user
    if current_user
      flash[:notice] = "You must be logged out to access this page."
      redirect_to root_url
      return false
    end
  end

  def require_user
    unless current_user
      store_location
      redirect_to login_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end
  
  def show_positions?
    current_user.has_role?(:admin)
  end
end
