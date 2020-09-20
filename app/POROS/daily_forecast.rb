class DailyForecast
  attr_reader :date_time,
              :description,
              :high_temp,
              :low_temp,
              :precipitation
              
  def initialize(data)
    @date_time = data[:dt]
    @description = data[:weather][0][:main]
    @high_temp = data[:temp][:max]
    @low_temp = data[:temp][:min]
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
end
