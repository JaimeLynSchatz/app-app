class SessionsController < ApplicationController
  
  def new
    @person = Person.new
  end
  
  def create
    @person = Person.find_by_email(params[:email])
    if @person && @person.unlocked? && @person.authenticate(params[:password])
      session[:uid]   = @person.id
      flash[:success] = "Successfully Signed In"
      redirect_to submission_path
    else
      flash.now[:notice] = "Email address and password do not match"
      render :new
    end
  end
  
  def destroy
    session[:uid] = nil
    redirect_to root_path
  end
  
end


