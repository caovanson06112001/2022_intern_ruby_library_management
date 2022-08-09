class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher
  has_many :category_book, dependent: :destroy
  has_many :category_books, through: :category_book
  has_one_attached :image
  accepts_nested_attributes_for :category_books

  delegate :name, :dob, to: :author, prefix: true
  delegate :name, :description, to: :publisher, prefix: true

  validates :name, presence: true, length: {minimum: Settings.book.min}
  validates :description, presence: true,
            length: {minimum: Settings.book.min}
  validates :quantity, presence: true, numericality: {only_integer: true}

  scope :latest_books, ->{order created_at: :desc}
end
