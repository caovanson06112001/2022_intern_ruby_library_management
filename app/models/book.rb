class Book < ApplicationRecord
  belongs_to :category_books
  belongs_to :authors
  has_one_attached :image

  validates :name, presence: true, length: {minimum: Settings.book.min}
  validates :description, presence: true,
            length: {minimum: Settings.book.min}
  validates :quantity, presence: true, numericality: {only_integer: true}
end
