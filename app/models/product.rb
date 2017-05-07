class Product < ApplicationRecord
  belongs_to :store
  has_many :product_images, :dependent => :destroy
  accepts_nested_attributes_for :product_images, :reject_if => lambda { |t| t['product_images'].nil? }
  has_many :shopping_lists, :dependent => :destroy

  validates :name, presence: true, length: {maximum: 50 }
  validates :price, presence: true, length: { maximum: 20 }
  validates :description,length: { maximum: 250 }
  validates :tag, length: { maximum: 100 }
  validates :store_id, presence: true
  validates :group, presence: true

  searchable do
    text :name, :description, :tag
  end
end
