require 'rails_helper'

RSpec.describe 'User API Endpoint' do
  describe 'POST /users' do
    it 'creates a new user in the database' do
      # expect(User.all.count).to eq(0)
      user_params = { email: 'joe@shmo.com', password: '12345', password_confirmation: '12345'}
      post '/api/v1/users', params: user_params

      result = JSON.parse(response.body, symbolize_names: true)

      expect(User.last.email).to eq(user_params[:email])
      expect(result).to have_key(:data)
      expect(result[:data]).to have_key(:type)
      expect(result[:data]).to have_key(:id)
      expect(result[:data]).to have_key(:attributes)
      expect(result[:data][:attributes]).to have_key(:email)
      expect(result[:data][:attributes]).to have_key(:api_key)
    end

    it 'doesnt allow the same email to be used more than once' do
      user_params = { email: 'joe@shmo.com', password: '12345', password_confirmation: '12345'}
      post '/api/v1/users', params: user_params
      # Sad path
      # Tries to recreate the same user
      post '/api/v1/users', params: user_params
      result = JSON.parse(response.body, symbolize_names: true)
      # expect(User.all.count).to eq(1)
      expect(result[:error]).to eq("This email already exists!")
    end
  end
end
