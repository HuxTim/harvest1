class StoreReview < ApplicationRecord
  belongs_to :user
  belongs_to :store

  validates :rating, presence: true, length: {maximum: 5 }
  validates :store_id, presence: true
  validates :user_id, presence: true
  validates :comment,length: { maximum: 250 }
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
end
