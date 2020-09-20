class HourlyForecast
  attr_reader :date_time,
              :hourly_temp 

  def initialize(data)
    @date_time = data[:dt]
    @hourly_temp = data[:temp]
  end
end
