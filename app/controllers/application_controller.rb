class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def current_user
    @current_user ||= Person.find(session[:uid])
  rescue ActiveRecord::RecordNotFound
    nil
  end
  helper_method :current_user
  
  def submission
    @submission = current_user.submission || current_user.create_submission if current_user
  end
  helper_method :submission
  
  def auth_user
    if current_user.blank?
      redirect_to "/sign-in"
    end
  end
end
