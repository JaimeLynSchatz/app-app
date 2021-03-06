class SubmissionsController < ApplicationController
  before_filter :auth_user
  before_filter :redirect_admins

  def edit
    
  end
  
  def update
    if submission.update(submission_params)
      submission.submit! if params[:commit] == "Submit Application"
      redirect_to submission_path
    else
      submission.status = "pending"
      render :edit
    end
  end
  
  private
  
  def submission_params
    params.require(:submission).permit(
      :resume_url,
      :video_interview_url,
      :reading_assessment_url,
      :logic_assessment_url,
      :twitter_handle,
      :website_url,
      :linkdin_url,
      :sponsorship_explaination,
      :wa_resident,
      :wa_student,
      :us_citizen,
      :financial_position
    )
  end
  
  def redirect_admins
    redirect_to admin_reviews_path if current_user && current_user.can?(:review)
  end
  
end