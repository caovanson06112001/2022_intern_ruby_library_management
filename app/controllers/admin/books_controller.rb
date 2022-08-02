class Admin::BooksController < AdminController
  before_action :logged_in_user

  def index
    @pagy, @books = pagy Book.latest_books,
                         items: Settings.max_page_user
  end
end
