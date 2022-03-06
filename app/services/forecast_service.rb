class ForecastService
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
