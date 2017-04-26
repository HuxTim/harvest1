class AddGroupToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :group, :string
  end
end
