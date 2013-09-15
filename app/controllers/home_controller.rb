class HomeController < ApplicationController
  def index
    redirect_to admin_reviews_path if current_user && !current_user.applicant?
  end
  
  def logic_puzzle
  end
end