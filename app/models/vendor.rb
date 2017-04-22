class Vendor < ApplicationRecord
  has_one :store
  has_one :user, dependent: :destroy
	validates :user_id, presence: true
end
