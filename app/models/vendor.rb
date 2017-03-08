class Vendor < ApplicationRecord
  belongs_to :user, dependent: :destroy
	validates :user_id, presence: true
	validates :description, length: { maximum: 200 }
end
