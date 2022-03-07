class BookSearchService
  def self.get_all_books(location)
    response = Faraday.get("http://openlibrary.org/search.json?title=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
