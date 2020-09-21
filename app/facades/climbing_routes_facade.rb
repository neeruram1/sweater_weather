class ClimbingRoutesFacade
  def coords(location)
    data = mapquest_service.coords(location)
    {
      lat: data[:locations][0][:latLng][:lat].round(2),
      lon: data[:locations][0][:latLng][:lng].round(2)
    }
  end

  def climbing_routes(location)
    routes_data = climbing_routes_service.nearby_routes(coords(location))
    routes_data.map { |data| ClimbingRoute.new(data) }
  end

  private

  def mapquest_service
    MapquestService.new
  end

  def climbing_routes_service
    ClimbingRoutesService.new
  end
end
