class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Redirects authentication failures
  def new_session_path(scope)
    root_path
  end

  def after_sign_in_path_for(user)
    apps_path
  end
end
