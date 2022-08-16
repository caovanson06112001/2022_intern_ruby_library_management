class Website::HomeController < WebsiteController
  def index
    @books = Book.latest_books.take Settings.max_item_book
  end
end
