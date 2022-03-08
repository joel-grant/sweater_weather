class User < ApplicationRecord
  validates :email, :password_digest, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_secure_password
  has_secure_token :auth_token

end
