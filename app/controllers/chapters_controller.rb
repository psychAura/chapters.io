class ChaptersController < ApplicationController
  def index
    service = NytBooksService.new
    @categories = {
      "Fiction" => "hardcover-fiction",
      "Nonfiction" => "hardcover-nonfiction",
    }

    # Fetch books for each category
    @books_by_category = {}
    @categories.each do |name, slug|
      @books_by_category[name] = service.top_books(slug, 10)
    end
  end
end
