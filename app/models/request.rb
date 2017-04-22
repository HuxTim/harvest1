class Request < ApplicationRecord
  belongs_to :market
  belongs_to :store
  validates :market_id, presence: true
  validates :store_id, presence: true
  validates :market_id, uniqueness: { scope: :store_id}
end
