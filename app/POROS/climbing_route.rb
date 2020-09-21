class ClimbingRoute
  attr_reader  :id,
               :name,
               :type,
               :rating,
               :location,
               :distance_to_route

  def initialize(data)
    @id = nil
    @name = data[:name]
    @type = data[:type]
    @rating = data[:rating]
    @location = data[:location]
    @distance_to_route = data[:distance_to_route]
  end
end
