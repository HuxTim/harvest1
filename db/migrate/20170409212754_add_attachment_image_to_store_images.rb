class AddAttachmentImageToStoreImages < ActiveRecord::Migration
  def self.up
    change_table :store_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :store_images, :image
  end
end
