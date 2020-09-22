class Api::V1::BaseController < ApplicationController
  def location
    params.permit(:location)
  end

  def user_response(user)
    UserSerializer.new(user)
  end

  def render_json_error(status, code)
    status_code = Rack::Utils::SYMBOL_TO_STATUS_CODE[status] if status.is_a? Symbol
    error = {
      title: I18n.t("error_messages.#{code}.title"),
      code: status_code,
      detail: I18n.t("error_messages.#{code}.detail")
    }
    render json: { errors: [error] }, status: status
  end

  def render_json_validation_error(status, resource)
    status_code = Rack::Utils::SYMBOL_TO_STATUS_CODE[status] if status.is_a? Symbol
   render json: { errors:
     {
       title: status.to_s.capitalize,
       code: status_code,
       detail: resource.errors.full_messages.join(', ')
      }
    }, status: status
  end
end
