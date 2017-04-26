class RemoveOpenTimeFromStores < ActiveRecord::Migration[5.0]
  def change
    remove_column :stores, :open_time, :integer
  end
end
