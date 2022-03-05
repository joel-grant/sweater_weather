class MapFacade
  def self.directions(start, stop)
    MapService.get_route(start, stop)
  end
end
