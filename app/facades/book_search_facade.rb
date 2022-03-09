class BookSearchFacade
  def self.find_books(location)
    BookSearchService.get_all_books(location)
  end
end
