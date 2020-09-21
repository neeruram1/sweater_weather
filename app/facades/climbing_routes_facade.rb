class ClimbingRoutesFacade
  def coords(location)
    data = mapquest_service.coords(location)
    {
      lat: data[:locations][0][:latLng][:lat],
      lon: data[:locations][0][:latLng][:lng]
    }
  end

  def climbing_routes(location)
    coordinates = coords(location)
    routes_data = climbing_routes_service.nearby_routes(coordinates)
    routes_data[:routes].map { |data| ClimbingRoute.new(data, coordinates) }
  end

  private

  def mapquest_service
    MapquestService.new
  end

  def climbing_routes_service
    ClimbingRoutesService.new
  end
end
