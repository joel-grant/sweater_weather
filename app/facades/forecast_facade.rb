class ForecastFacade
  def self.all_weather(location)
    coords = MapService.get_coordinates(location)
    latitude = coords[:results][0][:locations][0][:latLng][:lat]
    longitude = coords[:results][0][:locations][0][:latLng][:lng]
    ForecastService.get_forecast(latitude, longitude)
  end
end
