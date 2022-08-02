class Publiser < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true, length: {minimum: Settings.publisers.min}
  validates :description, presence: true,
            length: {minimum: Settings.publisers.min}
end
