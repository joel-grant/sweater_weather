require 'rails_helper'

RSpec.describe BookSearchService do
  describe '::get_all_books' do
    it 'returns all the search results from the Open Library API of books that are about a location' do
      data = BookSearchService.get_all_books("denver")

      expect(data).to be_a Hash
      # Make sure its parsed
      expect(data).to_not be JSON

      expect(data[:docs][0]).to have_key(:title)
      expect(data[:docs][0][:title]).to include("Denver")
    end
  end
end
