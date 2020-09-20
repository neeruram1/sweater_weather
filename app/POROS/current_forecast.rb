class CurrentForecast
  attr_reader :uv_index,
              :date_time,
              :current_temp,
              :sunset_time,
              :humidity,
              :sunrise_time,
              :feels_like,
              :visibility,
              :high_temp,
              :low_temp,
              :description

  def initialize(data)
    @uv_index = data[:current][:uvi]
    @date_time =  data[:current][:dt]
    @current_temp = data[:current][:temp]
    @sunset_time = data[:current][:sunset]
    @humidity =  data[:current][:humidity]
    @sunrise_time = data[:current][:sunrise]
    @feels_like = data[:current][:feels_like]
    @visibility = data[:current][:visibility]
    @high_temp_current = data[:daily][0][:temp][:max]
    @low_temp_current =  data[:daily][0][:temp][:min]
    @description = data[:current][:weather][0][:main]
  end
end
