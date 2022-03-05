class SessionsSerializer
  def self.send_token(user)
    {
      "data": {
        "type": "users",
        "id": user.id,
        "attributes": {
          "email": user.email,
          "api_key": user.auth_token
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
