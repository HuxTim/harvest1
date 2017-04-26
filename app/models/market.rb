class Market < ApplicationRecord
  belongs_to :user
  has_many :store_market_relationships
  has_many :stores, :through => :store_market_relationships,:dependent => :destroy
  has_many :market_reviews
  has_many :market_images, :dependent => :destroy
  has_many :requests,:dependent => :destroy
  accepts_nested_attributes_for :market_images, :reject_if => lambda { |t| t['market_images'].nil? }

  VALID_ZIPCODE_REGEX = /\A\d{5}-\d{4}|\A\d{5}\z/
  validates :name, presence: true, length: {maximum: 50 },allow_blank: false
  validates :address, presence: true, length: {maximum: 100 },allow_blank: false
  validates :zipcode, presence: true, length: { is: 5 }
  validates :state, presence: true, inclusion: { in: CS.states(:us).keys.collect{|x| x.to_s } }
  validates :city, presence: true, inclusion: { in: lambda{ |market| CS.cities(market.state.to_sym, :us) }}

  validates :open_time, presence: true
  validates :close_time, presence: true
  validates :description,length: { maximum: 750 }
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5}

  #how to validate the format of city and state

  validates :zipcode, format: {with: VALID_ZIPCODE_REGEX,message: "should be in the form 12345 or 12345-1234"}
  validates :open_time, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: :close_time }
  validates :close_time, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 604800 }
end
