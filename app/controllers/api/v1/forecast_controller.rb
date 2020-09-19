class Api::V1::ForecastController < ApplicationController
  def index
    coords = MapquestFacade.new.get_coords(location_param)
    binding.pry

  end

  private

  def location_param
    params.permit(:location)
  end
end
