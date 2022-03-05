class ForecastFacade
  def self.all_weather(location)
    data = ForecastService.get_coordinates(location)
    latitude = data[:results][0][:locations][0][:latLng][:lat]
    longitude = data[:results][0][:locations][0][:latLng][:lng]
    forecast_data = ForecastService.get_forecast(latitude, longitude)
  end

  # def self.route_data(location)
  #
  # end
end
