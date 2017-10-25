class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper :all
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    companies_path
    #request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end
end
