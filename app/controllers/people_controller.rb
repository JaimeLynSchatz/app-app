class PeopleController < ApplicationController
  before_filter :auth_user
  def show
    
  end
  
  def update
    @user = current_user
    current_user.update_attributes(person_params)
    redirect_to me_path
  end
  
  private
  def person_params
    params.require(:person).permit(:name, :email, :phone)
  end
end