class BackgroundFacade
  def self.image(location)
    data = BackgroundService.get_image(location)
    photo_url = data[:photos][0][:url]
  end
end
