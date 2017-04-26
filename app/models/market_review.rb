class MarketReview < ApplicationRecord
  belongs_to :user
  belongs_to :market

  validates :rating, presence: true, length: {maximum: 5 }
  validates :market_id, presence: true
  validates :user_id, presence: true
  validates :comment,length: { maximum: 750 }
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
end
