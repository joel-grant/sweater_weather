require 'rails_helper'

RSpec.describe MapService do
  describe '::get_coordinates' do
    it 'returns the coordinates of a location based on a keyword search' do
      location = "Denver"
      coordinate_data = MapService.get_coordinates(location)
      expect(coordinate_data).to be_a Hash

      expect(coordinate_data[:results][0]).to have_key(:locations)

      expect(coordinate_data[:results][0][:locations][0][:latLng]).to have_key(:lat)
      expect(coordinate_data[:results][0][:locations][0][:latLng]).to have_key(:lng)

      expect(coordinate_data[:results][0][:providedLocation]).to have_key(:location)
      expect(coordinate_data[:results][0][:providedLocation][:location]).to eq(location)

    end
  end

  describe '::get_route' do
    it 'returns the route based on a start and stop location' do
      start = "Denver,CO"
      stop = "Pueblo,CO"
      route_data = MapService.get_route(start, stop)
      expect(route_data).to be_a Hash
      expect(route_data[:route]).to have_key(:formattedTime)
      expect(route_data[:route]).to have_key(:realTime)
      expect(route_data[:info][:statuscode]).to_not eq(402)
      # require 'pry'; binding.pry
      # expect(route_data[:route]).to_not have_key(:routeError)
    end

    it 'indicates when a path isnt possible' do
      start = "Denver,CO"
      stop = "Honolulu,HI"
      impossible_route = MapService.get_route(start, stop)

      expect(impossible_route[:info][:statuscode]).to eq(402)
    end
  end
end
