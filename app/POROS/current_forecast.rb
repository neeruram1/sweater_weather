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
    @uv_index = data[:current][:uvi]
    @current_temp = data[:current][:temp]
    @humidity =  data[:current][:humidity]
    @feels_like = data[:current][:feels_like]
    @visibility = data[:current][:visibility]
    @date_time =  parse_time(data[:current][:dt])
    @high_temp_current = data[:daily][0][:temp][:max]
    @low_temp_current =  data[:daily][0][:temp][:min]
    @description = data[:current][:weather][0][:main]
    @sunset_time = parse_time(data[:current][:sunset])
    @sunrise_time = parse_time(data[:current][:sunrise])
  end

  def parse_time(time)
    DateTime.strptime(time.to_s, '%s')
  end
end
