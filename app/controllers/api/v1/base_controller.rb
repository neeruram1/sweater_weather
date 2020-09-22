class Api::V1::BaseController < ApplicationController
  def location
    params.permit(:location)
  end

  def errors(user, status)
    ErrorSerializer.new(user, status).errors
  end

  def user_response(user)
    UserSerializer.new(user)
  end
end
