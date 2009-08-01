class ApplicationController < ActionController::Base
  filter_parameter_logging :password, :password_confirmation
end
