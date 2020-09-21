class Api::V1::ClimbingRoutesController < ApplicationController
  def index
    binding.pry

  end

  private

  def location
    params.permit(:location)
  end
end
