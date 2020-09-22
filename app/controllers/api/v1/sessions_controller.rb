class Api::V1::SessionsController < Api::V1::BaseController
  before_action :find_user_by_email, only: [:create]

  def create
    if @user.nil?
      errors(:unauthorized, :invalid_login_email)
    elsif @user.authenticate(params[:password])
      login_user(UserSerializer.new(@user))
    else
      errors(:unauthorized, :invalid_login_password)
    end
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end
