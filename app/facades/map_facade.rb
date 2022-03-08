class MapFacade
  def self.directions(start, stop)
    data = MapService.get_route(start, stop)
  end
end
