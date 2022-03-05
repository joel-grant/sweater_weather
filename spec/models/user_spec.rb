require 'rails_helper'

RSpec.describe User do
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should have_secure_password }
end
