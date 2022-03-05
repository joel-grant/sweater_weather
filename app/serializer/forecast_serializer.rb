class ForecastSerializer
  include JSONAPI::Serializer

  def self.format(data)
    # require 'pry'; binding.pry
    test = {
      "data": {
        "id": nil,
        "type": "forecast",
        "attributes": {
          "current_weather": {
            "datetime": Time.at(data[:current][:dt]),
            "sunrise": Time.at(data[:current][:sunrise]),
            "sunset": Time.at(data[:current][:sunset]),
            "temperature": data[:current][:temp],
            "feels_like": data[:current][:feels_like],
            "humidity": data[:current][:humidity],
            "uvi": data[:current][:uvi],
            "visibility": data[:current][:visibility],
            "conditions": data[:current][:weather][0][:main],
            "icon": data[:current][:weather][0][:icon]
          },
          "daily_weather": daily_weather(data),
          "hourly_weather": hourly_weather(data)
        }
      }
    }
  end

  def self.daily_weather(data)
    data[:daily].slice(0, 5).map do |daily_weather|
      {
        "date": Time.at(daily_weather[:dt]).to_date,
        "sunrise": Time.at(daily_weather[:dt]),
        "sunset": Time.at(daily_weather[:dt]),
        "max_temp": daily_weather[:temp][:max],
        "min_temp": daily_weather[:temp][:min],
        "conditions": daily_weather[:weather][0][:main],
        "icon": daily_weather[:weather][0][:icon]
      }
    end
  end

  def self.hourly_weather(data)
    data[:hourly].slice(0, 8).map do |weather|
      {
        "time": Time.at(weather[:dt]).strftime("%I:%m %p"),
        "temperature": weather[:temp],
        "conditions": weather[:weather][0][:main],
        "icon": weather[:weather][0][:icon]
      }
    end
  end
end
