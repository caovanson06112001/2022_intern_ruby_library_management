class Website::HomeController < WebsiteController
  before_action :get_categories, only: :index

  def index
    @books = Book.latest_books.take Settings.max_item_book
  end

  private

  def get_categories
    @categories = Category.all
  end
end
