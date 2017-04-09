class StoreImage < ApplicationRecord
  belongs_to :store
  has_attached_file :image, :styles => {:large => "800x400#", :medium => "400x200#", :small => "200x100#"},
  :url  => "/assets/stores/:id/:style/:basename.:extension",
  :path => ":rails_root/public/assets/stores/:id/:style/:basename.:extension"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 10.megabytes
end
