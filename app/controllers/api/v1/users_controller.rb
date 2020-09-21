class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: serialize_user(user)
    else
      render json: serialize_error(user).bad_request, status: :bad_request
    end
  end

  private

  def serialize_error(data)
    ErrorSerializer.new(data)
  end

  def serialize_user(data)
    UserSerializer.new(data)
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
