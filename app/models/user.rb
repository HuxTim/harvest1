class User < ApplicationRecord
  has_one :vendor,:dependent => :destroy
  has_many :store_reviews
  has_many :market_reviews
  has_many :markets

  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

   has_secure_password
   validates :password, presence: true, length: { minimum: 6 }
	 validates :zipcode, presence: true, length: { is: 5 }

   def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
