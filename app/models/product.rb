class Product < ApplicationRecord
  belongs_to :store

  validates :name, presence: true, length: {maximum: 50 }
  validates :quantity, presence: true, length: { maximum: 20 }
  validates :price, presence: true, length: { maximum: 20 }
  validates :description,length: { maximum: 500 }
  validates :tag, presence: true, length: { maximum: 100 }
  validates :store_id, presence: true
end
