class BackgroundFacade
  def self.image(location)
    data = BackgroundService.get_image(location)
    photo_url = data[:photos][0][:url]
    # require 'pry'; binding.pry
    image_response = {
      "location": location,
      "image_url": data[:photos][0][:url],
      "credit": {
        "source": "pexels.com",
        "author": data[:photos][0][:photographer]
      }
    }
  end
end
