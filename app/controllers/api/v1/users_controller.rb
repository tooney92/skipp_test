class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render status: :created
    else
      json_error_response(user.errors.messages, :bad_request)
    end
  end

  def user_params
    params.permit(
      :email, :password
    )
  end
end
