class ChaptersController < ApplicationController
  def index
    service = NytBooksService.new
    @categories = {
      "Fiction" => "hardcover-fiction",
      "Non-fiction" => "hardcover-nonfiction",
      "Advice, How-To & Miscellaneous" => "advice-how-to-and-miscellaneous",
      "Young Adult" => "young-adult-hardcover"
    }

    # Fetchs books for each category
    @books_by_category = Rails.cache.fetch("nyt_books_by_category", expires_in: 7.days) do
      service = NytBooksService.new
      data = {}
      @categories.each do |name, slug|
        data[name] = service.top_books(slug, 10)
      end
      data
    end

    # Picks a random featured book from all categories
    @featured_book = Rails.cache.fetch("featured_book_of_the_week", expires_in: 1.week) do
      all_books = @books_by_category.values.flatten
      all_books.sample if all_books.present?
    end
  
  end
end
