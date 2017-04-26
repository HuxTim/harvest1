class AddCloseTimeToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :close_time, :integer
  end
end
