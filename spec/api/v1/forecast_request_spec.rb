require 'rails_helper'

RSpec.describe 'Forecast API' do
  describe 'GET /forecast?location=location' do
    it 'returns the forecast information based on the location provided' do
      location = "Breckenridge"
      get "/api/v1/forecast?location=#{location}"
      something = JSON.parse(response.body, symbolize_names: true)
      require 'pry'; binding.pry
    end
  end
end
