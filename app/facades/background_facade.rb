class BackgroundFacade
  def self.image(location)
    data = BackgroundService.get_image(location)
    Backgrounds.new(data)
  end
end
