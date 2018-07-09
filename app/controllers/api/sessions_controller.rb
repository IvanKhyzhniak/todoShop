class Api::SessionsController < ApplicationController
  skip_before_action :authenticate!, only: :create
  
  def create
    Sign.in!(resource_params[:session])
  end
  
  def destroy
    Sign.out!(current_user, request)
    head :no_content
  end
  
  private
  
  def resource_params
    params.require(:session).permit(:email, :password)
  end
end