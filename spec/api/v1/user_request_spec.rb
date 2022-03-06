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

      expect(result[:error]).to eq("This email already exists!")
    end

    it 'returns an error when a user tries to register with unmatching passwords' do
      user_params = { email: 'joe@shmo.com', password: '123457', password_confirmation: '12345'}
      post '/api/v1/users', params: user_params
      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(result[:error]).to eq("Your passwords must match!")
    end

    # it 'returns an error when a password is wrong' do
    #   user_params = { email: 'joe@shmo.com', password: '12345', password_confirmation: '12345'}
    #   post '/api/v1/users', params: user_params
    #
    #   # Sad path => log in with the wrong password
    #   incorrect_login_data = { email: 'joe@shmo.com', password: '123333'}
    #   post '/api/v1/sessions', params: incorrect_login_data
    #
    #   result = JSON.parse(response.body, symbolize_names: true)
    #
    #   expect(result).to have_key(:error)
    #   expect(result[:error]).to eq("Your credentials are incorrect!")
    # end
  end
end
