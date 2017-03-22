class Market < ApplicationRecord
  has_many :stores
  has_many :reviews

end
