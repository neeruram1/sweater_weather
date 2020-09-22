module Serviceable
  def coordinates(location)
    data = MapquestService.new.coords(location)
    {
      lat: data[:locations][0][:latLng][:lat],
      lon: data[:locations][0][:latLng][:lng]
    }
  end

  def weather_data(location)
    WeatherService.new.forecast(coordinates(location))
  end

  def lat_lng(location)
    data = MapquestService.new.coords(location)
    data[:locations][0][:latLng][:lat].to_s + ',' + data[:locations][0][:latLng][:lng].to_s
  end
end
