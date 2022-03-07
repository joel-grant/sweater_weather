require 'rails_helper'

RSpec.describe 'Book-Search API Endpoint' do
  describe 'GET /api/v1/book-search' do
    it 'returns the book and weather results based on location' do
      location = "Denver"
      quantity = 5
      get "/api/v1/book-search?location=#{location}&quantity=#{quantity}"
      results = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
