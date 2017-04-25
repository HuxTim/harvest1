class CreateStoreReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :store_reviews do |t|
      t.references :user, foreign_key: true
      t.references :store, foreign_key: true
      t.string :comment
      t.integer :rating

      t.timestamps
    end
  end
end
