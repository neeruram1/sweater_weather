require 'rails_helper'
describe 'Climbing routes facade' do
  describe 'Instance methods' do
    it ".coords" do
      facade = ClimbingRoutesFacade.new
      latitude = 39.738453
      longitude = -104.984853

      expect(facade.coords[:lat]).to eq(latitude.round(2))
      expect(facade.coords[:lon]).to eq(longitude.round(2))
    end
  end
end
