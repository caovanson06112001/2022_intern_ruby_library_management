class Website::SearchController < WebsiteController
  def index
    @search = Book.ransack(params[:q], auth_object: set_ransack_auth_object,
              quantity_book: 0)
    @search.sorts = ["name asc", "created_at desc"] if @search.sorts.empty?
    @pagy, @books = pagy @search.result(distinct: true),
                         items: Settings.book.max_page,
                         link_extra: 'data-remote="true"'
  end

  def show
    @search = Book.ransack(params[:q], auth_object: set_ransack_auth_object,
              quantity_book: 0)
    @search.sorts = ["name asc", "created_at desc"] if @search.sorts.empty?
    @pagy, @books = pagy @search.result(distinct: true),
                         items: Settings.book.max_page,
                         link_extra: 'data-remote="true"'
  end

  private

  def set_ransack_auth_object
    current_user.super_admin? ? :admin : :user
  end
end
