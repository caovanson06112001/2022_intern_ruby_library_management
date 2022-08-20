class Website::ProductsController < WebsiteController
  before_action :find_by_id, only: :show

  def index
    @book = Book.joins(:category_books).by_category_id params[:id]
    render json: @book
  end

  def show
    @category_books = @book.category_books
  end

  private

  def find_by_id
    @book = Book.find_by id: params[:id]
    return if @book

    flash[:danger] = t "website.products.not_found_book"
    redirect_to root_path
  end
end
