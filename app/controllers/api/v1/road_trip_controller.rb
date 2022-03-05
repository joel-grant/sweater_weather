class Api::V1::RoadTripController < ApplicationController
  def create
    if User.find_by(auth_token: params[:api_key])
      route_data = MapFacade.directions(params[:origin], params[:destination])
      route_weather = ForecastFacade.all_weather(params[:destination])
      render json: RoadTripSerializer.format(route_data, params[:origin], params[:destination], route_weather[:hourly])
    else
      render json: RoadTripSerializer.error("Invalid Authorization"), status: 401
    end
  end
end
