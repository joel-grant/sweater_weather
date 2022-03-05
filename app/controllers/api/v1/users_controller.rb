class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
