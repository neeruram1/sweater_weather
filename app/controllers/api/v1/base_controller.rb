class Api::V1::BaseController < ApplicationController
  def location
    params.permit(:location)
  end

  def invalid_credentials(user, status)
    ErrorSerializer.new(user, status).invalid_credentials
  end

  def serialize_errors(data, status)
    ErrorSerializer.new(data, status).errors
  end
end
