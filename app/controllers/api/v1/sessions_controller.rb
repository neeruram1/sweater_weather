class Api::V1::SessionsController < Api::V1::BaseController
  def create
    user = User.find_by(email: params[:email])
    if user.nil?
      render_json_error :unauthorized, :invalid_login
    elsif user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user_response(user)
    else
      render_json_error :unauthorized, :invalid_login
    end
  end
end
