class SignOut
  def self.execute!(user, request)
    user.sessions.find_by(auth_token: token_and_options(request)[0]).destroy!
  end
end