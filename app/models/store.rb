class Store < ApplicationRecord
  belongs_to :market
  belongs_to :vendor
  has_many :products
  has_many :reviews

  validates :name, presence: true, length: {maximum: 50 }
  validates :store_id, presence: true
  validates :market_id, presence: true
  validates :vendor_id, presence: true
  validates :open_time, presence: true
  validates :close_time, presence: true
  validates :description,length: { maximum: 500 }

  validates :open_time, numericality: { less_than_or_equal_to: 604800 }
  validates :close_time, numericality: { less_than_or_equal_to: 604800 }
  validates :open_time, numericality: { less_than_or_equal_to: :close_time }
end
