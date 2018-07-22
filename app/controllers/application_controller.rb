class ApplicationController < ActionController::API
  helper_method :resource, :current_user, :current_session

  attr_reader :resource, :current_session, :current_user

  before_action :authenticate!

  rescue_from ActionController::ParameterMissing do |exception|
    @exception = exception

    render :exception, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::RecordInvalid, ActiveModel::StrictValidationFailed do
    render :errors, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::RecordNotFound do
    @exception = 'Not Found'

    render :exception, status: :not_found
  end

  def create
    build_resource

    resource.save!
  end

  private

  def authenticate!
    authenticate_with_http_token do |token, options|
      @current_session = Session.find_by auth_token: token

      @current_user = User.joins(:sessions).find_by sessions: { auth_token: token }
    end
  end
end
