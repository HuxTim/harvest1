class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :quantity
      t.string :price
      t.string :description
      t.string :tag
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
