class RoadTripSerializer
  def self.format(data, start, stop, weather)
    trip_time = (data[:route][:time]/60/60.to_f).ceil
    {
      "data": {
        "id": nil,
        "type": "roadtrip",
        "attributes": {
          "start_city": start,
          "end_city": stop,
          "travel_time": data[:route][:formattedTime],
          "weather_at_eta": {
            "temperature": weather[trip_time - 1][:temp],
            "conditions": "partly cloudy with a chance of meatballs"
          }
        }
      }
    }
  end

  def self.error(error)
    {
      "error": error
    }
  end
end
