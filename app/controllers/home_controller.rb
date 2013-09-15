class HomeController < ApplicationController
  def index
    redirect_to admin_reviews_path if current_user && !current_user.applicant?
  end
end