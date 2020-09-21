class MapquestService
  def coords(location)
    to_json_address("?&location=#{location}")[:results].first
  end

  def distance_between_routes(coords1, coords2)
    binding.pry
    to_json_route("?&from=#{coords1}&to=#{coords2}")
  end

  private

  def to_json_address(url)
    response = conn_address.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def to_json_route(url)
    response = conn_route.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn_address
    Faraday.new('http://www.mapquestapi.com/geocoding/v1/address') do |f|
      f.params[:key] = ENV['mapquest_key'].to_s
    end
  end

  def conn_route
    Faraday.new('http://www.mapquestapi.com/directions/v2/route') do |f|
      f.params[:key] = ENV['mapquest_key'].to_s
    end
  end
end
