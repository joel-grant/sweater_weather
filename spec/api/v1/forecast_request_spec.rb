require 'rails_helper'

RSpec.describe 'Forecast API' do
  describe 'GET /forecast?location=location' do
    it 'returns the forecast information based on the location provided' do
      location = "Breckenridge"
      get "/api/v1/forecast?location=#{location}"
      something = JSON.parse(response.body, symbolize_names: true)

      expect(something).to have_key(:data)
      expect(something[:data]).to have_key(:id)
      expect(something[:data]).to have_key(:type)
      expect(something[:data]).to have_key(:attributes)
      expect(something[:data][:attributes][:current_weather]).to have_key(:datetime)
      expect(something[:data][:attributes][:current_weather]).to have_key(:sunrise)
      expect(something[:data][:attributes][:current_weather]).to have_key(:sunset)
      expect(something[:data][:attributes][:current_weather]).to have_key(:temperature)
      expect(something[:data][:attributes][:current_weather]).to have_key(:feels_like)
      expect(something[:data][:attributes][:current_weather]).to have_key(:humidity)
      expect(something[:data][:attributes][:current_weather]).to have_key(:uvi)
      expect(something[:data][:attributes][:current_weather]).to have_key(:visibility)
      expect(something[:data][:attributes][:current_weather]).to have_key(:conditions)
      expect(something[:data][:attributes][:current_weather]).to have_key(:icon)

      expect(something[:data][:attributes][:daily_weather].count).to eq(5)
      something[:data][:attributes][:daily_weather].each do |weather|
        expect(weather).to have_key(:date)
        expect(weather).to have_key(:sunrise)
        expect(weather).to have_key(:sunset)
        expect(weather).to have_key(:max_temp)
        expect(weather).to have_key(:min_temp)
        expect(weather).to have_key(:conditions)
        expect(weather).to have_key(:icon)
      end

      expect(something[:data][:attributes][:hourly_weather].count).to eq(8)
      something[:data][:attributes][:hourly_weather].each do |weather|
        expect(weather).to have_key(:time)
        expect(weather).to have_key(:temperature)
        expect(weather).to have_key(:conditions)
        expect(weather).to have_key(:icon)
      end
    end
  end
end
