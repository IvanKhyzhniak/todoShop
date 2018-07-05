class Api::SessionsController < ApplicationController
  skip_before_action :authenticate!, only: :create
  before_action :current_user
  
  def destroy
    current_user.auth_token.destroy
    
    head :no_content
  end
  
  private
  def resource
    @session ||= Session.new resource_params
  end

  def current_user
    authenticate_or_request_with_http_token do |token, options|
      @token = token
      @current_user = User.joins(:auth_token).find_by(auth_tokens: { value: token })
    end
  end
  
  def resource_params
    params.require(:session).permit(:email, :password)
  end
end