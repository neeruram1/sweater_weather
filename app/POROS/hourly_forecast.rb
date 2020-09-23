class HourlyForecast
  attr_reader :date_time,
              :hourly_temp

  def initialize(data)
    @hourly_temp = data[:hourly_temp]
    @date_time = data[:date_time]
  end
end
