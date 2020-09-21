class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    session[:user_id] = user.id
  end
end
