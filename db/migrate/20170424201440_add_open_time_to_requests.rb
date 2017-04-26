class AddOpenTimeToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :open_time, :integer
  end
end
