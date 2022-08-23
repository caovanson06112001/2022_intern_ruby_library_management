class Comment < ApplicationRecord
  belongs_to :user

  delegate :name, to: :user, prefix: true

  scope :latest, ->{order created_at: :desc}

  scope :find_comment, ->(book_id){where book_id: book_id}
end
