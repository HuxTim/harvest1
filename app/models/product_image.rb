class ProductImage < ApplicationRecord
  belongs_to :product
  has_attached_file :image, :styles => {:large => "400x400#", :medium => "200x200#", :small => "150x150#"},
  :url  => "/assets/products/:id/:style/:basename.:extension",
  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 10.megabytes
end
