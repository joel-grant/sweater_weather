class MapService
  def self.get_route(start, stop)
    conn = Faraday.new(url: "http://www.mapquestapi.com",
      params: { "key": ENV['mapquest_api_key'] }
    )
    response = conn.post("/directions/v2/route?from=#{start}&to=#{stop}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
