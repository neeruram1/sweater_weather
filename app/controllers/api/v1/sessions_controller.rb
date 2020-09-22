class Api::V1::SessionsController < Api::V1::BaseController
  before_action :find_user, only: [:create]

  def create
    if @user.nil?
      errors(:unauthorized, :invalid_login)
    elsif @user.authenticate(params[:password])
      register_user(UserSerializer.new(@user))
    else
      errors(:unauthorized, :invalid_login)
    end
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end
