class ChangeTimeTypeInStoreAndMarket < ActiveRecord::Migration[5.0]
  def change
    change_column :stores, :open_time, :integer
    change_column :stores, :close_time, :integer
    change_column :markets, :open_time, :integer
    change_column :markets, :close_time, :integer
  end
end
