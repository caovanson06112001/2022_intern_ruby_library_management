module BooksHelper
  def render_image_book
    image_tag(book.image, alt: book.name,
              class: "img-radius img-fluid wid-60")
  end
end
