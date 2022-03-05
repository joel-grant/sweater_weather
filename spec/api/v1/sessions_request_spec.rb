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
      require 'pry'; binding.pry
    end
  end
end
