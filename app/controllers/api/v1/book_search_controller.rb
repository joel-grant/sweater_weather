class Api::V1::BookSearchController < ApplicationController
  def index
    book_data = BookSearchFacade.find_books(params[:location])
    weather_data = ForecastFacade.all_weather(params[:location])
    render json: BookSearchSerializer.book_and_weather_results(book_data, weather_data, params[:quantity].to_i, params[:location])
  end
end
