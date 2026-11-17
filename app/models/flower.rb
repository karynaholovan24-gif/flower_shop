class Flower < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  validates :name, presence: true
  validates :category, presence: true
  validates :description, presence: true,
                          length: { minimum: 10, maximum: 1000 }
  validates :price, presence: true,
                    numericality: { greater_than: 0 }

  validate :image_format_and_size

  private

  def image_format_and_size
    return unless image.attached?

    allowed_types = ["image/jpeg", "image/png", "image/webp"]

    unless allowed_types.include?(image.blob.content_type)
      errors.add(:image, "повинно бути у форматі JPEG, PNG або WebP")
    end

    if image.blob.byte_size > 5.megabytes
      errors.add(:image, "не повинно перевищувати 5 МБ")
    end
  end
end