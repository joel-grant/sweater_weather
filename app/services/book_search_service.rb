class BookSearchService
  def self.get_all_books(location)
    conn = Faraday.new(url: "http://openlibrary.org") do |faraday|
      faraday.params[:title] = location
    end

    response = conn.get("/search.json?")
    JSON.parse(response.body, symbolize_names: true)
  end
end
