class CategoryBook < ApplicationRecord
  belongs_to :category
  belongs_to :book

  delegate :name, to: :category, prefix: true

  scope :find_books, ->(book_id){where book_id: book_id}
end
