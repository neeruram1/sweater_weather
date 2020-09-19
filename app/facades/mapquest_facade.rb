class MapquestFacade
  def get_coords(location)
    data = mapquest_service.get_coords(location)
    {lat: data[:locations][0][:latLng][:lat].round(2), lon: data[:locations][0][:latLng][:lng].round(2)}
  end

  private

  def mapquest_service
    MapquestService.new
  end
end
