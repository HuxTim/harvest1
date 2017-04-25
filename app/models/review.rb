class Review < ApplicationRecord
  belongs_to :user
  belongs_to :store, optional: true
  belongs_to :market, optional: true

  validates :rating, presence: true, length: {maximum: 5 }
  validates :market_id, presence: true
  validates :user_id, presence: true
  validates :description,length: { maximum: 250 }
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
end
