class Review < ApplicationRecord
  REVIEWS = %w[0 1 2 3 4 5].freeze
  belongs_to :restaurant
  validates :rating, :content, presence: true
  validates :rating, inclusion: { in: (0..5) }
  validates :rating, numericality: { only_integer: true }
end
