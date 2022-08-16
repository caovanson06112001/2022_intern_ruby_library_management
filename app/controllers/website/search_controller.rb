class Website::SearchController < WebsiteController
  def index
    @pagy, @books = pagy Book.search_book_name(params[:book_name])
                             .search_author(params[:author])
                             .search_category(params[:category]),
                         items: Settings.book.max_page
  end
end
