class Market < ApplicationRecord
  has_many :stores
  validates :description,  presence: true, length: { maximum: 500 }
  validates :open_time, presence: true, length: { maximum: 8}
  validates :open_time, presence: true, length: { maximum: 8}
end
