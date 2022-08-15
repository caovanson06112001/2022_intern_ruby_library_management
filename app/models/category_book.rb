class CategoryBook < ApplicationRecord
  belongs_to :category
  belongs_to :book

  scope :find_books, ->(book_id){where book_id: book_id}
end
