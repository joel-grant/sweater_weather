require 'rails_helper'

RSpec.describe BookSearchService do
  describe '::get_all_books' do
    it 'returns all the search results from the Open Library API of books that are about a location' do
      data = BookSearchService.get_all_books("denver")

      expect(data).to be_a Hash

      expect(data).to_not be JSON

      expect(data[:docs][0]).to have_key(:title)
      expect(data[:docs][0][:title]).to include("Denver")

      data[:docs].each do |book|
        expect(book).to have_key(:title)
        expect(book[:title]).to be_a String
        # require 'pry'; binding.pry
        # Some lesser-known books also dont have a publisher field
        # expect(book).to have_key(:publisher)
        # expect(book[:publisher]).to be_an Array


        # ISBN Does not seem to always exist for a search result...

        # expect(book).to have_key(:isbn).or eq(nil)
        # expect(book[:isbn]).to be_an Array
      end
    end
  end
end
