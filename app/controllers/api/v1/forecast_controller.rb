class Api::V1::ForecastController < ApplicationController
  def index
    data = ForecastFacade.all_weather(params[:location])
    render json: ForecastSerializer.format(data)
  end
end
