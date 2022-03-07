require 'rails_helper'

RSpec.describe 'Book-Search API Endpoint' do
  describe 'GET /api/v1/book-search' do
    it 'returns the book and weather results based on location' do
      location = "Denver"
      quantity = 5
      get "/api/v1/book-search?location=#{location}&quantity=#{quantity}"
      results = JSON.parse(response.body, symbolize_names: true)
require 'pry'; binding.pry
      expect(results).to have_key(:data)
      expect(results).to be_a Hash
      expect(results[:data]).to be_a Hash
      expect(results[:data]).to have_key(:id)
      expect(results[:data][:id]).to be nil
      expect(results[:data]).to have_key(:type)
      expect(results[:data][:type]).to eq("books")
      expect(results[:data]).to have_key(:attributes)
      expect(results[:data][:attributes]).to be_a Hash
      expect(results[:data][:attributes]).to have_key(:destination)
      expect(results[:data][:attributes][:destination]).to eq(location)
      expect(results[:data][:attributes]).to have_key(:forecast)
      expect(results[:data][:attributes][:forecast]).to be_a Hash
      expect(results[:data][:attributes][:forecast]).to have_key(:summary)
      expect(results[:data][:attributes][:forecast]).to have_key(:temperature)
      expect(results[:data][:attributes][:forecast][:temperature]).to be_a String
      expect(results[:data][:attributes]).to have_key(:total_books_found)
      expect(results[:data][:attributes]).to have_key(:books)
      expect(results[:data][:attributes][:books]).to be_an Array
      expect(results[:data][:attributes][:books].count).to eq(quantity)

      results[:data][:attributes][:books].each do |book|
        expect(book).to have_key(:isbn)
        expect(book[:isbn]).to be_an Array
        expect(book).to have_key(:title)
        expect(book).to have_key(:publisher)
        expect(book[:publisher]).to be_an Array
      end





      require 'pry'; binding.pry
    end
  end
end
