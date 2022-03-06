require 'rails_helper'

RSpec.describe MapFacade do
  describe '::directions' do
    it 'returns the details for a trip between two locations' do
      start = "Denver, Co"
      stop = "Pueblo, Co"
      data = MapFacade.directions(start, stop)

      expect(data).to be_a Hash
    end

    it 'can inform the user when a route is impossible' do
      start = "Denver, Co"
      stop = "Honolulu, HI"
      data = MapFacade.directions(start, stop)

      expect(data[:info][:statuscode]).to eq(402)
      expect(data[:info][:messages]).to eq(["We are unable to route with the given locations."])
      expect(data[:route]).to have_key(:routeError)

      expect(data[:route]).to_not have_key(:time)      
    end
  end
end
