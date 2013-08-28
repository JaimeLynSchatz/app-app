class Admin::SubmissionsController < AdminController
  
  def index
    @submissions = Submission.with_status("submitted").sort_by {|submission| submission.reviews.count }
  end
  
end