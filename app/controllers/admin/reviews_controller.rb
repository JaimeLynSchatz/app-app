class Admin::ReviewsController < AdminController
  
  def index
    @reviews = current_user.reviews.order("complete asc")
    @applicant = Person.with_role("applicant").sort_by {|person| person.submission.reviews.count }.first
  end
  
  def edit
    @review = current_user.reviews.find(params[:id])
    @submission = @review.submission
  end
  
  def update
    @review = current_user.reviews.find(params[:id])
    if @review.update_attributes(review_params)
      redirect_to admin_reviews_path
    else
      @submission = @review.submission
      render :edit
    end
  end
  
  def assign
    @person = Person.find(params[:person_id])
    if current_user.reviewed?(@person)
      redirect_to admin_people_path, notice: "You aleady have reviewed that submission"
    else
      @review = @person.submission.reviews.build(person_id: current_user.id)
      if @review.save
        redirect_to admin_edit_review_path(@review)
      end
    end
  end
  
  private
  
  def review_params
    params.require(:review).permit(
      :feedback,
      :score,
      :complete
    )
  end
end