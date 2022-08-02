class Book < ApplicationRecord
  has_many :category_books, dependent: :destroy
  belongs_to :author
  belongs_to :publiser
  has_one_attached :image
  accepts_nested_attributes_for :category_books

  validates :name, presence: true, length: {minimum: Settings.book.min}
  validates :description, presence: true,
            length: {minimum: Settings.book.min}
  validates :quantity, presence: true, numericality: {only_integer: true}

  scope :latest_books, ->{order created_at: :desc}
end
