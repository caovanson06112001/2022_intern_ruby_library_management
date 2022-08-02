class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true, length: {minimum: Settings.author.min}
  validates :description, presence: true,
            length: {minimum: Settings.author.min}
end
