class DailyForecast
  attr_reader :date_time,
              :description,
              :high_temp_daily,
              :low_temp_daily,
              :precipitation,
              :day_of_week

  def initialize(data)
    @day_of_week = parse_time(data[:dt]).strftime("%A")
    @date_time = parse_time(data[:dt])
    @description = data[:weather][0][:main]
    @high_temp_daily = data[:temp][:max]
    @low_temp_daily = data[:temp][:min]
    @precipitation = total_precipitation(data)
  end

  def total_precipitation(data)
    if data[:rain].nil? && data[:snow].nil?
      return 0
    elsif data[:snow].nil? && data[:rain].nil? == false
      data[:rain]
    elsif data[:rain].nil? && data[:snow].nil? == false
      data[:snow]
    else
      data[:rain] + data[:snow]
    end
  end

  def parse_time(time)
    DateTime.strptime(time.to_s, '%s')
  end
end
