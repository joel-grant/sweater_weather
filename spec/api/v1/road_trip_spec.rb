require 'rails_helper'

RSpec.describe 'Road Trip API Endpoint' do
  describe 'POST /road_trip' do
    it 'returns basic details of a route' do
      user_params = { email: 'joe@shmo.com', password: '12345', password_confirmation: '12345'}
      post '/api/v1/users', params: user_params
      last_user = User.last
      trip_params = { origin: "Denver,CO", destination: "Pueblo,CO", api_key: last_user.auth_token }
      post '/api/v1/road_trip', params: trip_params
      result = JSON.parse(response.body, symbolize_names: true)

      expect(result).to have_key(:data)
      expect(result[:data]).to have_key(:id)
      expect(result[:data]).to have_key(:type)
      expect(result[:data]).to have_key(:attributes)
      expect(result[:data][:attributes]).to have_key(:start_city)
      expect(result[:data][:attributes]).to have_key(:end_city)
      expect(result[:data][:attributes]).to have_key(:travel_time)
      expect(result[:data][:attributes]).to have_key(:weather_at_eta)
      expect(result[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(result[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    end

    it 'will say that a route is impossible if the locations arent connected' do
      user_params = { email: 'joe@shmo.com', password: '12345', password_confirmation: '12345'}
      post '/api/v1/users', params: user_params
      last_user = User.last

      trip_params = { origin: "Denver,CO", destination: "Sydney, Australia", api_key: last_user.auth_token }
      post '/api/v1/road_trip', params: trip_params
      result = JSON.parse(response.body, symbolize_names: true)

      expect(result).to have_key(:data)
      expect(result[:data][:attributes][:travel_time]).to eq("impossible")
      expect(result[:data][:attributes][:weather_at_eta][:temperature]).to be nil
      expect(result[:data][:attributes][:weather_at_eta][:conditions]).to be nil
    end
  end
end
