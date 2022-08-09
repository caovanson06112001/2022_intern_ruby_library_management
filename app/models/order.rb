class Order < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_many :books, through: :order_details
  accepts_nested_attributes_for :order_details

  validates :day_start, presence: true
end
