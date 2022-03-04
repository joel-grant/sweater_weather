require 'rails_helper'

RSpec.describe 'Background API' do
  describe 'GET /backgrounds' do
    it 'returns the background image based on the location search' do
      location = "Denver"
      get "/api/v1/backgrounds?location=#{location}"
      something = JSON.parse(response.body, symbolize_names: true)

      expect(something[:data][:attributes]).to have_key(:id)
      expect(something[:data][:attributes]).to have_key(:photographer)
      expect(something[:data][:attributes]).to have_key(:url)
      expect(something[:data][:attributes]).to have_key(:alt)
    end
  end
end
