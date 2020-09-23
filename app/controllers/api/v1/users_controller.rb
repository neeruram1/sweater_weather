class Api::V1::UsersController < Api::V1::BaseController
  before_action :new_user, only: [:create]

  def create
    @user.save ? registeration_success(UserSerializer.new(@user)) : errors(:unauthorized, @user)
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def registeration_success(user)
    render json: user, status: :created
  end
end
