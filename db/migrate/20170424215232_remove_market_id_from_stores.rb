class RemoveMarketIdFromStores < ActiveRecord::Migration[5.0]
  def change
    remove_column :stores, :market_id, :integer
  end
end
