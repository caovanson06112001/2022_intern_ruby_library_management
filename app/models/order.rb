class Order < ApplicationRecord
  FIELD_PERMIT = %i(user_id approval note_user note_admin date_start
                    date_return).freeze

  enum approval: {pending: 0, approved: 1, returned: 2}

  belongs_to :user, ->{select %i(id name email)}
  has_many :order_details, dependent: :destroy
  has_many :books, through: :order_details
  accepts_nested_attributes_for :order_details

  validates :note_admin, presence: true

  scope :latest, ->{order updated_at: :desc}

  def send_mail_confirm_order
    OrderMailer.send_note_admin(self).deliver_now
  end
end
