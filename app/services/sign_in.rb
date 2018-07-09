class SignIn
  def self.execute!(params)
    @user ||= User.find_by email: params[:email]
    if @user.authenticate params[:password]
     @session ||= @user.sessions.create!
    else
      raise AuthorizationError
    end
  end
end