class RoadTripSerializer
  def self.format(data, start, stop, weather)
    if !data[:route][:time].nil?
      trip_time = (data[:route][:time]/60/60.to_f).ceil
      formatted_travel_time = data[:route][:formattedTime]
      temperature = weather[trip_time - 1][:temp]
      conditions = weather[trip_time -1][:weather][0][:main]
    else
      weather = nil
      formatted_travel_time = "impossible"
      temperature = nil
      conditions = nil
    end

    {
      "data": {
        "id": nil,
        "type": "roadtrip",
        "attributes": {
          "start_city": start,
          "end_city": stop,
          "travel_time": formatted_travel_time,
          "weather_at_eta": {
            "temperature": temperature,
            "conditions": conditions
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
