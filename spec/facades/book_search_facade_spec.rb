require 'rails_helper'

RSpec.describe BookSearchFacade do
  describe '::find_books' do
    it 'returns the books about a location city' do
      data = BookSearchFacade.find_books("denver")

      expect(data).to be_a Hash

      expect(data).to have_key(:numFound)
      expect(data[:numFound]).to be_a Integer

      expect(data[:docs][0]).to have_key(:title)
      expect(data[:docs][0][:title]).to include("Denver")
    end
  end
end
