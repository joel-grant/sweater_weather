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
end
