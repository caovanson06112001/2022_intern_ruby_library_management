class CategoryBook < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true, length: {minimum: Settings.book.min}

  scope :latest_category, ->{order created_at: :desc}
end
