require "httparty"

class NytBooksService
  BASE_URL = "https://api.nytimes.com/svc/books/v3"

  def initialize(api_key = ENV["NYT_API_KEY"])
    @api_key = api_key
  end

  def top_books(list = "hardcover-fiction", limit = 10)
    url = "#{BASE_URL}/lists/current/#{list}.json?api-key=#{@api_key}"
    response = HTTParty.get(url)

    if response.success?
      response.parsed_response["results"]["books"].first(limit)
    else
      []
    end
  end
end