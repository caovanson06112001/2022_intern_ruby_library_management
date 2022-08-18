class Order < ApplicationRecord
  FIELD_PERMIT = %i(user_id status note_user note_admin date_start
                    date_return).freeze
  ORDER_PARAMS = [:date_start, :date_return, :note_user, :user_id,
    {book_ids: [], order_details_attributes: [:id, :book_id, :quantity]}].freeze

  before_save :update_status

  enum status: {pending: 0, approved: 1, returned: 2}

  belongs_to :user, ->{select %i(id name email)}
  has_many :order_details, dependent: :destroy
  has_many :books, through: :order_details
  accepts_nested_attributes_for :order_details

  scope :latest, ->{order updated_at: :desc}

  def send_mail_confirm_order
    OrderMailer.send_note_admin(self).deliver_now
  end

  private

  def update_status
    self[:status] = 0
  end
end
