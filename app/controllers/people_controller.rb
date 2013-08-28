class PeopleController < ApplicationController
  before_filter :auth_user, except: [:new, :create, :new_reviewer, :create_reviewer]

  def new
    @person = Person.new
  end
  
  def new_reviewer
    @person = Person.new
  end

  def update
    @user = current_user
    current_user.update_attributes(person_params)
    flash[:success] = "Updated Profile"
    redirect_to root_path
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      session[:uid] = @person.id
      redirect_to submission_path
    else
      render :new
    end
  end
  
  def create_reviewer
    @person = Person.new(person_params)
    @person.role   = :reviewer
    @person.locked = true
    if @person.save
      #SEND EMAIL
      flash[:success] = "Thank for signing up, you will receive an approval email soon."
      redirect_to root_path
    else
      render :new_reviewer
    end
    
  end

  private
  def person_params
    params.require(:person).permit(
      :name, 
      :email, 
      :phone, 
      :password, 
      :password_confirmation,
      :street,
      :street_two,
      :city,
      :state,
      :postal_code,
      :phone
    )
  end
end