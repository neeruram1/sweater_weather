require 'rails_helper'

describe RoadTrip, type: :model do
  describe 'validations' do
    it { should validate_presence_of :api_key }
    it { should validate_presence_of :origin }
    it { should validate_presence_of :destination }
    it { should validate_presence_of :travel_time }
  end

  describe 'relationships' do
    it { should belong_to :user }
  end
end
