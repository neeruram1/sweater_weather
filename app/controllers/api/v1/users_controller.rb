class Api::V1::UsersController < ApplicationController
  def create
    binding.pry
    user = User.new(user_params)
    if user.save
      render json: serialize_user(user)
    else
      render json: user.errors.full_messages.to_sentence
    end
  end

  private

  def serialize_user(data)
    UserSerializer.new(data)
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
