class BackgroundService
  def self.get_image(location)
    conn = Faraday.new(url: "https://api.pexels.com",
      headers: {
      "Authorization": ENV['image_api_key']
      }
    )
    response = conn.get("/v1/search?query=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
