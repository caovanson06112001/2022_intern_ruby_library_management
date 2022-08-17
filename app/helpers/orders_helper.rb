module OrdersHelper
  def book_cart books_ids
    session[:book_cart] = books_ids
  end

  def session_book
    session[:book_cart]
  end

  def count_book
    session_book.size
  end

  def add_book_to_cart book
    arr = Array.new
    arr.push session_book unless session_book.nil?
    arr.unshift book.id
    book_cart arr.flatten.uniq
  end

  def delete_cart book_id
    arr = session_book
    arr.delete book_id.to_i
    book_cart arr
  end

  def delete_all_cart
    session.delete :book_cart
  end
end
