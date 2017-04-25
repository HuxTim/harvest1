class RemoveIndexAddUserIdForMarket < ActiveRecord::Migration[5.0]
  def change
    add_column :markets, :user_id, :integer
    remove_index :stores, column: :market_id
  end
end
