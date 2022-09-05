class Website::CartsController < WebsiteController
  before_action :logged_in_user
  before_action :find_order, only: %i(show destroy)
  before_action :check_approved, only: :destroy

  def index
    @pagy, @order = pagy current_user.orders.latest
  end

  def show
    @order_book = Book.joins(:order_details)
                      .select_order.by_order @order.id
    respond_to do |format|
      format.js do
        render "website/carts/show"
      end
    end
  end

  def destroy
    if @order.canceled!
      flash[:success] = t "order.returned_success"
    else
      flash[:danger] = t "books.returned_faild"
    end
    redirect_to carts_path
  end

  private

  def find_order
    @order = Order.find_by id: params[:id]
    return if @order

    flash[:danger] = t "books.find_error"
    redirect_to admin_books_path
  end

  def check_approved
    return unless @order.approved? || @order.returned?

    flash[:warning] = t "books.is_approved"
    redirect_to carts_path
  end
end
