# "Sweater Weather" Project


## How to Register with the App and get an API Key:
1. Register for a new user using the endpoint `POST /api/v1/users`
  The user's registration information must be sent in the body of the request...
  ```json
    {
    "email": "whatever@example.com",
    "password": "password",
    "password_confirmation": "password"
    }
```
  A sucessful response will have a response similar to this one:
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
  A successful response will look similar to this one: 
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
