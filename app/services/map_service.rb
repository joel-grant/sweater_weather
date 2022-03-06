class MapService
  def self.get_coordinates(location)
    conn = Faraday.new(url: "http://www.mapquestapi.com",
      params: { "key": ENV['mapquest_api_key'] }
    )
    response = conn.get("/geocoding/v1/address?location=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def self.get_route(start, stop)
    conn = Faraday.new(url: "http://www.mapquestapi.com",
      params: { "key": ENV['mapquest_api_key'] }
    )
    response = conn.post("/directions/v2/route?from=#{start}&to=#{stop}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
