class Api::V1::UsersController < Api::V1::BaseController
  def create
    user = User.new(user_params)
    if user.save
      render json: user_response(user)
    else
      render_json_validation_error :unauthorized, user
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
