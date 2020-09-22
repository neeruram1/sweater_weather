class Api::V1::BackgroundController < Api::V1::BaseController
  def index
    render json: ImageSerializer.new(Image.new(data(location)))
  end

  def data(location)
    ImageFacade.new.image_data(location)
  end
end
