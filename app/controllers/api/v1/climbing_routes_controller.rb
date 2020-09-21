class Api::V1::ClimbingRoutesController < ApplicationController
  def index

  end

  private

  def location
    params.permit(:location)
  end
end
