class StoreMarketRelationship < ApplicationRecord
  belongs_to :store
  belongs_to :market

  validates :open_time, presence: true
  validates :close_time, presence: true
  validates :open_time, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: :close_time }
  validates :close_time, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 604800 }
end
