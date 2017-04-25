class Vendor < ApplicationRecord
  has_one :store
  belongs_to :user
	validates :user_id, presence: true
end
