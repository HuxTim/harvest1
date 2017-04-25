class CreateMarketImages < ActiveRecord::Migration[5.0]
  def change
    create_table :market_images do |t|
      t.integer :market_id
      t.timestamps
    end
  end
end
