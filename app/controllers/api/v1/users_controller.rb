class Api::V1::UsersController < Api::V1::BaseController
  def create
    user = User.new(user_params)
    if user.save
      render json: serialize_user(user)
    else
      render json: serialize_errors(user, 401), status: :unauthorized
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
