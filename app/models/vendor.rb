class Vendor < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :stores
	validates :user_id, presence: true
	validates :description, length: { maximum: 200 }

  validates :user_id, presence: true
  validates :description,length: { maximum: 500 }
end
