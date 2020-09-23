require 'rails_helper'
describe Weather do
  it "Exists" do

    attrs =
    {
      id: nil, daily: [{ dt: 1600530774, temp: { min: 45, max: 43 }, weather: [{ main: 'cool'}], precipitation: 4.0, day_of_week: 'Tuesday' }],
      hourly: [{ dt: 1600530774, temp: 45 }],
      current: { uvi: 5, temp: 56, humidity: 65, feels_like: 45, visibility: 23, dt: 1600530774, weather: [{ main: 'this is fun' }], sunset: 1600530774, sunrise: 1600530774 }}

    location = 'denver, co'

    weather = Weather.new(attrs, location)
    expect(weather).to be_a Weather
    expect(weather.id).to eq(nil)
    expect(weather.daily_forecasts).to be_a Array
    expect(weather.daily_forecasts[0].day_of_week).to eq('Saturday')
    expect(weather.hourly_forecasts).to be_a Array
    expect(weather.hourly_forecasts[0].hourly_temp).to eq(45)
    expect(weather.current_forecast).to be_a CurrentForecast
    expect(weather.current_forecast.description).to eq('this is fun')
  end
end
