class BookSearchSerializer
  def self.book_and_weather_results(book_data, weather_data, result_quantity, location)
    {
      "data": {
        "id": nil,
        "type": "books",
        "attributes": {
          "destination": location,
          "forecast": {
            "summary": weather_data[:current][:weather][0][:main],
            "temperature": "#{weather_data[:current][:temp]} F"
          },
          "total_books_found": book_data[:numFound],
          "books": book_data[:docs].first(result_quantity).map do |book|
            {
              "isbn": book[:isbn] ||= [],
              "title": book[:title],
              "publisher": book[:publisher]
            }
          end
        }
      }
    }
  end
end
