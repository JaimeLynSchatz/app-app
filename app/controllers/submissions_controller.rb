class SubmissionsController < ApplicationController
  before_filter :find_submission
  def edit
    
  end
  
  private
  
  def find_submission
    @submission = current_user.submission || current_user.create_submission
  end
end