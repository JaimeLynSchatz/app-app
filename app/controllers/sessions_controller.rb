class SessionsController < ApplicationController
  
  def create
    person = Person.find_or_create_by_auth_hash(auth_hash)
    session[:uid] = person.uid
    redirect_to step_one_path
  end
  
  def destroy
    session[:uid] = nil
    redirect_to root_path
  end
  
  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end


