class Backgrounds
  attr_reader :id, :url, :photographer, :alt
  
  def initialize(data)
    @id = data[:photos][0][:id]
    @url = data[:photos][0][:url]
    @photographer = data[:photos][0][:photographer]
    @alt = data[:photos][0][:alt]
  end
end
