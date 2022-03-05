require 'rails_helper'

RSpec.describe 'User API Endpoint' do
  describe 'POST /users' do
    it 'creates a new user in the database' do
      user_params = { email: 'joe@shmo.com', password: '12345', password_confirmation: '12345'}
      post '/api/v1/users', params: user_params
      created_user = User.last

      expect(User.last.email).to eq(user_params[:email])
    end
  end
end
