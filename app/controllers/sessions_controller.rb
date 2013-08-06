class SessionsController < ApplicationController
  
  def create
    auth_hash
    raise
  end
  
  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end


