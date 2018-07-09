class Sign
  include ActionController::HttpAuthentication::Token
  include ActiveModel::Validations
  
  validate do |model|
    if user
      model.errors.add :password, 'is invalid' unless password?
    else
      model.errors.add :email, 'not found'
    end
  end
  
  def Sign.in!(params)
    @params = params&.symbolize_keys || {}
    
    raise AuthorizationError unless valid?
    
    user.sessions.create!
  end
  
  def Sign.out!(user, request)
    user.sessions.find_by(auth_token: token_and_options(request)[0]).destroy!
  end
  
  private
  
  def user
    @user ||= User.find_by email: @params[:email]
  end

  def password?
    user.authenticate @params[:password]
  end
  
end