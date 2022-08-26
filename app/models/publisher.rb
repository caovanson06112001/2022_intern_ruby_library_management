class Publisher < ApplicationRecord
  FIELD_PERMIT = %i(name description image).freeze

  has_many :books, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true, length:
            {minimum: Settings.publishers.min, maximum: Settings.publishers.max}
  validates :description, presence: true,
            length: {minimum: Settings.publishers.min}
  validates :image, content_type: {in: Settings.author.image_type},
                    size: {less_than: Settings.author.image_size.megabytes}

  scope :latest, ->{order created_at: :desc}

  def display_image
    image.filename.present? ? image : Settings.publishers.avatar_default
  end
end
