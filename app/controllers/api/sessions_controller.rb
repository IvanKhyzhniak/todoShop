class Api::SessionsController < ApplicationController
  include ActionController::HttpAuthentication::Token
  skip_before_action :authenticate!, only: :create
  
  def create
    @user = User.find_by email: params[:email]
    if @user.password_diges == params[:password]
     @session = @user.sessions.create!
    else
      raise AuthorizationError
    end
  end
  
  def destroy
    current_user.sessions.find_by(auth_token: token_and_options(request)).destroy
    
    head :no_content
  end
  
  private
  # def resource
  #   @session ||= @user.sessions.new 
  # end
  
  def resource_params
    params.require(:session).permit(:email, :password)
  end
end