class CreateStoreImages < ActiveRecord::Migration[5.0]
  def change
    create_table :store_images do |t|
      t.integer :store_id
      t.timestamps
    end
  end
end
