class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :description
      t.string :open_time
      t.string :close_time
      t.references :vendor, foreign_key: true
      t.references :market, foreign_key: true
      
      t.timestamps
    end
  end
end
