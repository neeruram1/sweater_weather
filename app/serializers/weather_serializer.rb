class WeatherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :current_forecast, :daily_forecasts, :hourly_forecasts
end
