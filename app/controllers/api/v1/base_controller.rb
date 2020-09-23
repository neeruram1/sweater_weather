class Api::V1::BaseController < ApplicationController
  include Serviceable

  def find_user_by_email
    @user = User.find_by(email: params[:email])
  end

  def find_user_by_api_key
    @user = User.find_by(api_key: params[:api_key])
  end

  def new_user
    @user = User.new(user_params)
  end

  def errors(status, input)
    error =
      {
        title: http_symbol?(input) ? I18n.t("error_messages.#{input}.title") : format_status(status),
        code: status_code(status),
        detail: http_symbol?(input) ? I18n.t("error_messages.#{input}.detail") : full_errors(input)
      }
    render json: { errors: error }, status: status
  end

  def status_code(status)
    Rack::Utils::SYMBOL_TO_STATUS_CODE[status] if status.is_a?(Symbol)
  end

  def full_errors(input)
    input.errors.full_messages.join(', ')
  end

  def http_symbol?(input)
    input.is_a?(Symbol)
  end

  def format_status(status)
    status.to_s.capitalize
  end
end
