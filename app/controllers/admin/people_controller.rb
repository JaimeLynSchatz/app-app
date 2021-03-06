class Admin::PeopleController < AdminController
  before_filter :auth_admin
  def index
    @people = Person.scoped
  end
  
  def edit
    @person = Person.find(params[:id])
  end
  
  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(params.require(:person).permit!)
      flash[:success] = "Updated #{@person.name}"
      redirect_to admin_people_path
    else
      render :edit
    end
  end
  
  def unlock
    @person = Person.find(params[:id])
    if @person.update(locked: false)
      PersonMailer.reviewer_accepted(@person.id).deliver
      flash[:success] = "Approved #{@person.name}. They will be notified via email."
      redirect_to admin_people_path
    else
      render :edit
    end
  end
  
end