class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :store_id
      t.string :name
      t.integer :quantity
      t.float :price
      t.string :description
      t.string :tag

      t.timestamps
    end
  end
end
