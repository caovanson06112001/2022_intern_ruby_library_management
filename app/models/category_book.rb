class CategoryBook < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true, length: {minimum: Settings.book.min}
end
