class Api::V1::BackgroundController < Api::V1::BaseController
  def index
    render json: serialize_image(image(location))
  end

  private

  def serialize_image(data)
    ImageSerializer.new(data)
  end

  def image(location)
    ImageFacade.new.background_img(location)
  end
end
