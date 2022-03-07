require 'rails_helper'

RSpec.describe BookSearchFacade do
  describe '::find_books' do
    it 'returns the books about a location city' do
      data = BookSearchFacade.find_books("denver")
      require 'pry'; binding.pry
    end
  end
end
