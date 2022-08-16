class OrderDetail < ApplicationRecord
  enum status: {pending: 0, accept: 1, disagree: 2}

  belongs_to :order
  belongs_to :book
end
