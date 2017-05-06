class Store < ApplicationRecord
  belongs_to :vendor
  has_many :products
  has_many :store_reviews
  has_many :store_images, :dependent => :destroy
  has_many :store_market_relationships, :dependent => :destroy
  has_many :requests,:dependent => :destroy, :dependent => :destroy
  has_many :markets, -> { uniq }, :through => :store_market_relationships,:dependent => :destroy
  accepts_nested_attributes_for :store_images, :reject_if => lambda { |t| t['store_images'].nil? }

  validates :name, presence: true, length: {maximum: 50 }
  validates :vendor_id, presence: true
  validates :description,length: { maximum: 750 }

  searchable do
  text :name, :description
  end
end
