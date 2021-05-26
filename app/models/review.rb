class Review < ApplicationRecord
  belongs_to :restaurant
  # self.restaurant
  validates :content, presence: true #you cannot save a review without a content
end
