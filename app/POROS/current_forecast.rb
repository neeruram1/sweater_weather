class CurrentForecast
  attr_reader :uv_index,
              :low_temp,
              :humidity,
              :date_time,
              :high_temp,
              :feels_like,
              :visibility,
              :sunset_time,
              :description,
              :current_temp,
              :sunrise_time

  def initialize(data)
    @uv_index = data[:uv_index]
    @low_temp = data[:low_temp]
    @humidity = data[:humidity]
    @date_time = data[:date_time]
    @high_temp = data[:high_temp]
    @feels_like = data[:feels_like]
    @visibility = data[:visibility]
    @sunset_time = data[:sunset_time]
    @description = data[:description]
    @current_temp = data[:current_temp]
    @sunrise_time = data[:sunrise_time]
  end
end
