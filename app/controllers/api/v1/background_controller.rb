class Api::V1::BackgroundController < Api::V1::BaseController
  def index
    render json: image_response(image(location))
  end
  private

  def image(location)
    ImageFacade.new.background_img(location)
  end

  def image_response(data)
    ImageSerializer.new(data)
  end
end
