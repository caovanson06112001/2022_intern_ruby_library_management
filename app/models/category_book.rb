class CategoryBook < ApplicationRecord
  has_many :category_book, dependent: :destroy
  has_many :books, through: :category_book

  validates :name, presence: true, length: {minimum: Settings.book.min}

  scope :latest_category, ->{order created_at: :desc}
end
