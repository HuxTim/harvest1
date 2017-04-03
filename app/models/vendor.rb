class Vendor < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :stores
	validates :user_id, presence: true
end
