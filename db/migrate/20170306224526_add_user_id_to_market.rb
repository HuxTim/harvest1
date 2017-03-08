class AddUserIdToMarket < ActiveRecord::Migration[5.0]
  def change
    add_column :markets, :user_id, :integer
  end
end
