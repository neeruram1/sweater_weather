class Api::V1::BackgroundController < ApplicationController
  def index
    render json: serialize_image(image(location))
  end

  private

  def location
    params.permit(:location)
  end

  def serialize_image(data)
    ImageSerializer.new(data)
  end

  def image(location)
    ImageFacade.new.background_img(location)
  end
end