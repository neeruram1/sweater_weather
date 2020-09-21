class ClimbingRoute
  attr_reader  :id,
               :name,
               :type,
               :rating,
               :location,
               :distance_to_route

  def initialize(data, city_coordinates)
    binding.pry
    @id = nil
    @name = data[:name]
    @type = data[:type]
    @rating = data[:rating]
    @location = data[:location]
    @distance_to_route = data[:distance_to_route]
    @route_coordinates = "#{data[:latitude]}" + ',' + "#{data[:longitude]}"
  end
end
