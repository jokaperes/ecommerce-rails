class Product < ApplicationRecord
  has_rich_text :description
  has_many_attached :images

  # Validations
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  # Scopes for efficient querying
  scope :ordered, -> { order(created_at: :desc) }
  scope :with_associations, -> { with_rich_text_description.with_attached_images }
end
