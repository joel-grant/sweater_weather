class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      render json: UsersSerializer.send_token(user), status: 201
    elsif User.find_by(email: params[:email])
      render json: UsersSerializer.error("This email already exists!"), status: 403
    elsif params[:password] != params[:password_confirmation]
      render json: UsersSerializer.error("Your passwords must match!"), status: 400
    end
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation, :auth_token)
  end
end
