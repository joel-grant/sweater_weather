class ForecastService
  def self.get_coordinates(location)
    conn = Faraday.new(url: "http://www.mapquestapi.com",
      params: { "key": ENV['mapquest_api_key'] }
    )
    response = conn.get("/geocoding/v1/address?location=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_forecast(lat, lon)
    conn = Faraday.new(url: "https://api.openweathermap.org") do |faraday|
      faraday.params[:lat] = lat
      faraday.params[:lon] = lon
      faraday.params[:exclude] = "minutely"
      faraday.params[:units] = "imperial"
      faraday.params[:appid] = ENV['forecast_api_key']
    end
    response = conn.get("/data/2.5/onecall")
    JSON.parse(response.body, symbolize_names: true)
  end

end
