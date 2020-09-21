class ImageFacade
  def background_img(location)
    image_data = image_service.background_img(location)
    Image.new(image_data, location)
  end

  private

  def image_service
    ImageService.new
  end
end
