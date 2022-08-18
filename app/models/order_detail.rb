class OrderDetail < ApplicationRecord
  before_save :update_status

  enum status: {pending: 0, accept: 1, disagree: 2}

  belongs_to :order
  belongs_to :book

  private

  def update_status
    self[:status] = 0
  end
end
