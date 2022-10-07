
module AuthHelpers
  include JsonWebToken

  def user_login(user)
    token = jwt_encode({user_id: user.id})
  end

end
