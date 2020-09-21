class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: serialize_user(user)
    else
      render json: serialize_errors(user, 400), status: :bad_request
    end
  end

  private

  def serialize_user(data)
    UserSerializer.new(data)
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def serialize_errors(data, status)
    ErrorSerializer.new(data, status).errors
  end
end
