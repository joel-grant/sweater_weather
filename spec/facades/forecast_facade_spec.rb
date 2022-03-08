require 'rails_helper'

RSpec.describe ForecastFacade do
  describe '::all_weather' do
    it 'returns all the weather from the one call api endpoint' do
      data = ForecastFacade.all_weather("denver,co")

      expect(data[:lat]).to eq(39.7385)
      expect(data[:lon]).to eq(-104.9849)
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
