class ClimbingRoute
  attr_reader  :id,
               :name,
               :type,
               :rating,
               :location,
               :distance_to_route

  def initialize(data, city_coordinates)
    @id = nil
    @name = data[:name]
    @type = data[:type]
    @rating = data[:rating]
    @location = data[:location]
    @distance_to_route = distance(data, city_coordinates)[:distance]
  end

  def distance(data, city_coordinates)
    city_coords = "#{city_coordinates[:lat]}" + ',' + "#{city_coordinates[:lon]}"
    route_coords = "#{data[:latitude]}" + ',' + "#{data[:longitude]}"
    mapquest_service.distance_between_routes(city_coords, route_coords )
  end

  private

  def mapquest_service
    MapquestService.new
  end
end
