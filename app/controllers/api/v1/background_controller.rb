class Api::V1::BackgroundController < Api::V1::BaseController
  def index
    params[:location].empty? ? errors(:bad_request, :no_location) : image_success(image_params)
  end

  private

  def image_params
    params.permit(:location)
  end

  def image_success(image_params)
    render json: ImageSerializer.new(Image.new(ImageFacade.new.data(image_params)))
  end
end
