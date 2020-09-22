class Api::V1::SessionsController < Api::V1::BaseController
  def create
    user = User.find_by(email: params[:email])
    if user.nil?
      render json: ErrorSerializer.new(user, 400).invalid_credentials, status: :bad_request
    elsif user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UserSerializer.new(user)
    else
      render json: ErrorSerializer.new(user, 400).invalid_credentials, status: :bad_request
    end
  end
end
