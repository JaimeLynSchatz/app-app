class AdminController < ApplicationController
  before_filter :auth_user
  before_filter :auth_reviewer
  def auth_reviewer
    unless current_user.can? :review
      redirect_to sign_in_path, notice: "Please sign in as an admin."
    end
  end
  
  def auth_admin
    unless current_user.can? :admin
      redirect_to sign_in_path, notice: "Please sign in as an admin."
    end
  end
end