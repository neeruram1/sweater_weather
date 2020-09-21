class ClimbingRoutesFacade
  def coords(location)
    data = mapquest_service.coords(location)
    {
      lat: data[:locations][0][:latLng][:lat].round(2),
      lon: data[:locations][0][:latLng][:lng].round(2)
    }
  end

  private

  def mapquest_service
    MapquestService.new
  end
end
