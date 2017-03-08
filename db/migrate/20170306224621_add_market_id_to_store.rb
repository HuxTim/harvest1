class AddMarketIdToStore < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :market_id, :integer
  end
end
