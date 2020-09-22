class Api::V1::BaseController < ApplicationController
  include Serviceable
  
  def register_user(user)
    render json: user, status: :created
  end

  def login_user(user)
    render json: user, status: :ok
  end

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
      title: input.is_a?(Symbol) ? I18n.t("error_messages.#{input}.title") : status.to_s.capitalize,
      code: status_code(status),
      detail: input.is_a?(Symbol) ? I18n.t("error_messages.#{input}.detail") : input.errors.full_messages.join(', ')
    }
    render json: { errors: error }, status: status
  end

  def status_code(status)
    Rack::Utils::SYMBOL_TO_STATUS_CODE[status] if status.is_a?(Symbol)
  end
end
