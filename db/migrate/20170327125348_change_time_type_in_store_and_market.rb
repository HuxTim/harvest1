class ChangeTimeTypeInStoreAndMarket < ActiveRecord::Migration[5.0]
  def change
    # change_column :stores, :open_time, :integer
    # change_column :stores, :close_time, :integer
    # change_column :markets, :open_time, :integer
    # change_column :markets, :close_time, :integer

    change_column :stores, :open_time, 'integer USING CAST(open_time AS integer)'
    change_column :stores, :close_time, 'integer USING CAST(close_time AS integer)'
    change_column :markets, :open_time, 'integer USING CAST(open_time AS integer)'
    change_column :markets, :close_time, 'integer USING CAST(close_time AS integer)'
  end
end
