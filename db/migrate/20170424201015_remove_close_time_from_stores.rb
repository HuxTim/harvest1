class RemoveCloseTimeFromStores < ActiveRecord::Migration[5.0]
  def change
    remove_column :stores, :close_time, :integer
  end
end
