class AddStoreAndMarketTable < ActiveRecord::Migration[5.0]
  def up
    create_table :store_market_relationships do |t|
      t.integer :store_id
      t.integer :market_id
      t.integer :close_time
      t.integer :open_time
      t.timestamps
    end
  end

  def down
    drop_table :store_market_relationships
  end
end
