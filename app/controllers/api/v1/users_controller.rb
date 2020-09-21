class Api::V1::UsersController < ApplicationController
  def create
    render json: serialize_user(User.create(user_params).generate_api_key)
  end

  private

  def serialize_user(data)
    UserSerializer.new(data)
  end

  def user_params
    params.permit(:email, :password)
  end
end
