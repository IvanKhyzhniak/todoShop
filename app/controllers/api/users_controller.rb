class UsersController < ApplicationController
  skip_before_action :authenticate!, only: :create

  def show
  end

  private

  def build_resource
    @user = User.new resource_params
  end

  def resource
    @user ||= current_user
  end

  def resource_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
end
