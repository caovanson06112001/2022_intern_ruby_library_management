class Category < ApplicationRecord
  has_many :category_books, dependent: :destroy
  has_many :books, through: :category_books

  validates :name, presence: true, length: {minimum: Settings.book.min}

  scope :latest_category, ->{order created_at: :desc}
end
