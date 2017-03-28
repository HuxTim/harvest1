class Review < ApplicationRecord
  belongs_to :user
  belongs_to :store, optional: true
  belongs_to :market, optional: true

  validates :rating, presence: true, length: {maximum: 5 }
  validates :store_id, presence: true
  validates :market_id, presence: true
  validates :user_id, presence: true
  validates :description,length: { maximum: 500 }
end
