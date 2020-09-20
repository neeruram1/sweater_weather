class ImageFacade
  def background_img(location)
    image_data = image_service.background_img(coords(location))
    Image.new(image_data, location)
  end

  def coords(location)
    data = mapquest_service.coords(location)
    {
      lat: data[:locations][0][:latLng][:lat].round(2),
      lon: data[:locations][0][:latLng][:lng].round(2)
    }
  end

  private

  def image_service
    ImageService.new
  end

  def mapquest_service
    MapquestService.new
  end
end
