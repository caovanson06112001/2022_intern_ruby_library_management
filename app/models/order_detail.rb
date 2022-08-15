class OrderDetail < ApplicationRecord
  enum status: {cart: 0, pending: 1, approved: 2, finished: 3, canceled: 4}

  belongs_to :order
  belongs_to :book

  validates :quantity, :date_end, presence: true
end
