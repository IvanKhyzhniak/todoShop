class Api::SessionsController < ApplicationController
  include ActionController::HttpAuthentication::Token
  skip_before_action :authenticate!, only: :create
  
  def create
    @user ||= User.find_by email: resource_params[:email]
    if @user.authenticate resource_params[:password]
     @session ||= @user.sessions.create!
    else
      raise AuthorizationError
    end
  end
  
  def destroy
    current_user.sessions.find_by(auth_token: token_and_options(request)[0]).destroy
    
    head :no_content
  end
  
  private
  
  def resource_params
    params.require(:session).permit(:email, :password)
  end
end