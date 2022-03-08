require 'rails_helper'

RSpec.describe ForecastService do
  describe '::get_forecast' do
    it 'returns the forecast data for a given location' do
      data = ForecastService.get_forecast(39.7392, -104.9903)

      expect(data).to be_a Hash

      expect(data).to have_key(:lat)
      expect(data).to have_key(:lon)
      expect(data[:lat]).to be_a Float
      expect(data[:lon]).to be_a Float

      expect(data).to have_key(:current)
      expect(data[:current]).to have_key(:dt)
      expect(data[:current]).to have_key(:sunrise)
      expect(data[:current]).to have_key(:sunset)
      expect(data[:current]).to have_key(:temp)
      expect(data[:current]).to have_key(:feels_like)
      expect(data[:current]).to have_key(:humidity)
      expect(data[:current]).to have_key(:uvi)
      expect(data[:current]).to have_key(:visibility)
      expect(data[:current][:weather][0]).to have_key(:main)
      expect(data[:current][:weather][0]).to have_key(:icon)
      expect(data[:hourly].count).to eq(48)
    end
  end
end
