class ProductImage < ApplicationRecord
  belongs_to :product
  has_attached_file :image, :styles => {:large => "800x200#", :medium => "400x100#", :small => "200x50#"},
  :url  => "/assets/products/:id/:style/:basename.:extension",
  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 10.megabytes
end
