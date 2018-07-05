class Api::SessionsController < ApplicationController
  include ActionController::HttpAuthentication::Token
  skip_before_action :authenticate!, only: :create
  
  def create
    @user = current_user
    super
  end
  
  def destroy
    current_user.sessions.find_by(auth_token: token_and_options(request)).destroy
    
    head :no_content
  end
  
  private
  def resource
    @session ||= current_user.sessions.new 
  end
  
  def resource_params
    params.require(:session).permit(:email, :password)
  end
end