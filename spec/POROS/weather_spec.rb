require 'rails_helper'
describe Weather do
  before(:each) do
    @attrs =
    {
      id: nil, daily: [{ dt: 1600530774, temp: { min: 45, max: 43 }, weather: [{ main: 'cool'}], precipitation: 4.0, day_of_week: 'Tuesday' }],
      hourly: [{ dt: 1600530774, temp: 45 }],
      current: { uvi: 5, temp: 56, humidity: 65, feels_like: 45, visibility: 23, dt: 1600530774, weather: [{ main: 'this is fun' }], sunset: 1600530774, sunrise: 1600530774 }}

    location = 'denver, co'

    @weather = Weather.new(@attrs, location)
  end
  it "Exists" do
    expect(@weather).to be_a Weather
    expect(@weather.id).to eq(nil)
    expect(@weather.daily_forecasts).to be_a Array
    expect(@weather.daily_forecasts[0].day_of_week).to eq('Saturday')
    expect(@weather.hourly_forecasts).to be_a Array
    expect(@weather.hourly_forecasts[0].hourly_temp).to eq(45)
    expect(@weather.current_forecast).to be_a CurrentForecast
    expect(@weather.current_forecast.description).to eq('this is fun')
  end

  it "total_precipitation" do
    data1 = { rain: 2.0, snow: 3.0 }
    data2 = { sleet: 8.0 }
    data3 = { rain: 7.0 }
    data4 = { snow: 6.0 }

    expect(@weather.total_precipitation(data1)).to eq(5.0)
    expect(@weather.total_precipitation(data2)).to eq(0.0)
    expect(@weather.total_precipitation(data3)).to eq(7.0)
    expect(@weather.total_precipitation(data4)).to eq(6.0)
  end

  it "no_precipitation?" do
    data1 = { rain: 2.0, snow: 3.0 }
    data2 = { sleet: 8.0 }
    data3 = { rain: 7.0 }
    data4 = { snow: 6.0 }

    expect(@weather.no_precipitation?(data1)).to eq(false)
    expect(@weather.no_precipitation?(data2)).to eq(true)
    expect(@weather.no_precipitation?(data3)).to eq(false)
    expect(@weather.no_precipitation?(data4)).to eq(false)
  end

  it "rain_present?" do
    data1 = { rain: 2.0, snow: 3.0 }
    data2 = { sleet: 8.0 }
    data3 = { rain: 7.0 }
    data4 = { snow: 6.0 }

    expect(@weather.rain_present?(data1)).to eq(true)
    expect(@weather.rain_present?(data2)).to eq(false)
    expect(@weather.rain_present?(data3)).to eq(true)
    expect(@weather.rain_present?(data4)).to eq(false)
  end

  it "snow_present?" do
    data1 = { rain: 2.0, snow: 3.0 }
    data2 = { sleet: 8.0 }
    data3 = { rain: 7.0 }
    data4 = { snow: 6.0 }

    expect(@weather.snow_present?(data1)).to eq(true)
    expect(@weather.snow_present?(data2)).to eq(false)
    expect(@weather.snow_present?(data3)).to eq(false)
    expect(@weather.snow_present?(data4)).to eq(true)
  end

  it "parse_time" do
    time = 1600530774

    expect(@weather.parse_time(time)).to eq('Sat, 19 Sep 2020 15:52:54')
  end
end
