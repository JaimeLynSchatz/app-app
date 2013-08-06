class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def current_user
    @current_user ||= Person.find_by(uid: session[:uid])
  end
  helper_method :current_user
  
  def auth_user
    if current_user.blank?
      redirect_to "/auth/github"
    end
  end
end
