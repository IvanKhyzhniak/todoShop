class Api::SessionsController < ApplicationController
  include ActionController::HttpAuthentication::Token
  skip_before_action :authenticate!, only: :create
  
  def create
    SignIn.execute!(resource_params[:session])
  end
  
  def destroy
    SignOut.execute!(current_user, request)
    head :no_content
  end
  
  private
  
  def resource_params
    params.require(:session).permit(:email, :password)
  end
end