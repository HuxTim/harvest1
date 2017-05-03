class Vendor < ApplicationRecord
  has_one :store,:dependent => :destroy
  belongs_to :user
	validates :user_id, presence: true
  has_many :requests, :through => :store
end
