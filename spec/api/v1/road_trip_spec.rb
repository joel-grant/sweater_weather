require 'rails_helper'

RSpec.describe 'Road Trip API Endpoint' do
  describe 'POST /road_trip' do
    it 'returns basic details of a route' do
      user_params = { email: 'joe@shmo.com', password: '12345', password_confirmation: '12345'}
      post '/api/v1/users', params: user_params
      last_user = User.last
      trip_params = { origin: "Denver,CO", destination: "Pueblo,CO", api_key: last_user.auth_token }
      post '/api/v1/road_trip', params: trip_params

      require 'pry'; binding.pry
    end
  end
end
