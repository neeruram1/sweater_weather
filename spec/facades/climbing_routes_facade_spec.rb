require 'rails_helper'
describe 'Climbing routes facade' do
  describe 'Instance methods' do
    it ".coords()", :vcr do
      facade = ClimbingRoutesFacade.new
      latitude = 39.738453
      longitude = -104.984853
      location = 'denver, co'

      expect(facade.coords(location)[:lat]).to eq(latitude)
      expect(facade.coords(location)[:lon]).to eq(longitude)
    end

    it ".climbing_routes()", :vcr do
      facade = ClimbingRoutesFacade.new
      location = 'denver, co'

      expect(facade.climbing_routes(location)).to be_a Array
      expect(facade.climbing_routes(location)[0]).to be_a ClimbingRoute
    end
  end
end
