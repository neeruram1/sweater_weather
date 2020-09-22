class Api::V1::SessionsController < Api::V1::BaseController
  def create
    user = User.find_by(email: params[:email])
    if user.nil?
      render json: errors(user, 401), status: :unauthorized
    elsif user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user_response(user)
    else
      render json: errors(user, 401), status: :unauthorized
    end
  end
end
