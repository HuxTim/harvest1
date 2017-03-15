class Review < ApplicationRecord
  belongs_to :user
  belongs_to :store, optional: true
  belongs_to :market, optional: true
end
