class ClimbingRoute
  attr_readers :id,
               :name,
               :type,
               :rating,
               :location,
               :distance_to_route

  def initialize(data)
    @id = 'placeholder'
    @name = 'placeholder'
    @type = 'placeholder'
    @rating = 'placeholder'
    @location = 'placeholder'
    @distance_to_route = 'placeholder'
  end
end
