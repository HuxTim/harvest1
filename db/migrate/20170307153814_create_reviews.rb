class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :rating
      t.string :description
      t.references :user, foreign_key: true
      t.references :market, foreign_key: true
      t.references :store, foreign_key: true


      t.timestamps
    end
  end
end
