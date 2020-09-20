class WeatherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :current_forecast, :daily_forecasts, :hourly_forecasts
end
