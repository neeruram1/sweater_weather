class Api::V1::BaseController < ApplicationController
  def location
    params.permit(:location)
  end
end
