class Market < ApplicationRecord
  has_many :stores
  has_many :reviews

  VALID_ZIPCODE_REGEX = /\A\d{5}-\d{4}|\A\d{5}\z/

  validates :name, presence: true, length: {maximum: 50 },  uniqueness: { case_sensitive: false }, allow_blank: false
  validates :zipcode, presence: true, length: { is: 5 }
  validates :city, presence: true, length: { maximum: 20 }
  validates :state, presence: true, length: { maximum: 20 }
  validates :open_time, presence: true
  validates :close_time, presence: true
  validates :description,length: { maximum: 500 }

  #how to validate the format of city and state

  validates :zipcode, format: {with: VALID_ZIPCODE_REGEX,message: "should be in the form 12345 or 12345-1234"}
  validates :open_time, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: :close_time }
  validates :close_time, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 604800 }
end
