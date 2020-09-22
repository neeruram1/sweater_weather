class Api::V1::BackgroundController < Api::V1::BaseController
  def index
    render json: ImageSerializer.new(Image.new(ImageFacade.new.data(image_params)))
  end

  private

  def image_params
    params.permit(:location)
  end
end
