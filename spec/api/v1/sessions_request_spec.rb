require 'rails_helper'

RSpec.describe 'User Sessions' do
  describe 'POST /sessions' do
    it 'logs in a user and returns the auth token as confirmation' do
      user_params = { email: 'joe@shmo.com', password: '12345', password_confirmation: '12345'}
      post '/api/v1/users', params: user_params

      expect(response).to be_successful
      login_params = {email: 'joe@shmo.com', password: '12345'}
      post '/api/v1/sessions', params: login_params

      expect(response).to be_successful
    end

    it 'returns an error if the password is bad' do
      user_params = { email: 'joe@shmo.com', password: '12345', password_confirmation: '12345'}
      post '/api/v1/users', params: user_params

      expect(response).to be_successful

      login_params = {email: 'joe@shmo.com', password: 'ABCDE'}
      post '/api/v1/sessions', params: login_params

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result[:error]).to eq("Your credentials are incorrect!")
    end

    it 'returns an error if the user doesnt exist' do
      user_params = { email: 'joe@shmo.com', password: '12345', password_confirmation: '12345'}
      post '/api/v1/users', params: user_params
      expect(response).to be_successful

      non_existent_user = {email: 'joe12345@shmo.com', password: 'ABCDE'}
      post '/api/v1/sessions', params: non_existent_user

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result[:error]).to eq("Your credentials are incorrect!")
    end
  end
end
