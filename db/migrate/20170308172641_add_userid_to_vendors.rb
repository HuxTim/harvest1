class AddUseridToVendors < ActiveRecord::Migration[5.0]
  def change
    add_column :vendors, :user_id, :integer
  end
end
