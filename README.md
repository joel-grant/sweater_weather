# "Sweater Weather" Project
## Description
This is an application built for a project at Turing School of Software and Design.  This is a backend-only application that has several endpoints to:
   1.  Create a user
   2.  Sign in as a user
   3.  Look at weather, with location specific images
   4.  Create a naviation route and see the weather when you arrive


## Learning Objectives of this Project 
1.  API Consumption
2.  API Creation
3.  API Authorization
4.  Understanding POST requests with secure data passed in the body.
5.  Using multiple API endpoints to create new features.
6.  Create API endpoints for CRUD functionality.
7.  Practice researching API documentation for consumption.

## How to use the application
This application is not deployed and needs to be ran on your own localhost to test its functionality through tools such as Postman.
1.  Clone this repo.
2.  `cd sweater_weather`
3.  run `bundle`
4.  `rails s`
5.  Using an application such as postman, follow the instructions as described below.


## How to Register with the App and get an API Key:
1. Register for a new user using the endpoint `POST /api/v1/users`
  The user's registration information must be sent in the body of the request, like so:
  ```json
    {
    "email": "whatever@example.com",
    "password": "password",
    "password_confirmation": "password"
    }
```
  A sucessful request will be have a response formatted like this one:
  ```json
  {
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
      }
    }
  }
```
2.  To Log in, send a request to  `POST /api/v1/sessions`
  The following must be included in the body of the post request:
  ```json
  {
  "email": "whatever@example.com",
  "password": "password"
  }
  ```
  A successful request will be have a response formatted like this one: 
  ```json
  {
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
      }
    }
  }
  ```
3.  Retrieve weather for a specific city at `GET /api/v1/forecast?location=<location>`
  Sending a request to this endpoint with only a location param will trigger the following response:
  ```json
  {
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "datetime": "2020-09-30 13:27:03 -0600",
        "temperature": 79.4,
        etc
      },
      "daily_weather": [
        {
          "date": "2020-10-01",
          "sunrise": "2020-10-01 06:10:43 -0600",
          etc
        },
        {...} etc
      ],
      "hourly_weather": [
        {
          "time": "14:00:00",
          "conditions": "cloudy with a chance of meatballs",
          etc
        },
        {...} etc
      ]
    }
  }
}
```
4.  If you want a background for your weather data, `GET /api/v1/backgrounds?location=<location>`
Sending a request to this endpoint with only a location param wil trigger the following response with an 200 response:
```json
{
  "data": {
    "type": "image",
    "id": null,
    "attributes": {
      "image": {
        "location": "denver,co",
        "image_url": "https://pixabay.com/get/54e6d4444f50a814f1dc8460962930761c38d6ed534c704c7c2878dd954dc451_640.jpg",
        "credit": {
          "source": "pixabay.com",
          "author": "quinntheislander",
          "logo": "https://pixabay.com/static/img/logo_square.png"
        }
      }
    }
  }
}
```
5.  Get a route at `POST /api/v1/road_trip`
  To get a route, you must send an *authenticated* POST request with a body in the following format:
```json
{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```

A successful response will have the following format:

```json
{
  "data": {
    "id": null,
    "type": "roadtrip",
    "attributes": {
      "start_city": "Denver, CO",
      "end_city": "Estes Park, CO",
      "travel_time": "2 hours, 13 minutes"
      "weather_at_eta": {
        "temperature": 59.4,
        "conditions": "partly cloudy with a chance of meatballs"
      }
    }
  }
}
```

If you request a route that is impossible to make by car, the following response will be sent:
```json
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver,CO",
            "end_city": "Honolulu,HI",
            "travel_time": "impossible",
            "weather_at_eta": {
                "temperature": null,
                "conditions": null
            }
        }
    }
}
```
If there is a problem with your Auth Token, the following response will be sent.
```json
{
    "error": "Invalid Authorization"
}
```
