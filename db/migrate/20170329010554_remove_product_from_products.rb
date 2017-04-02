class RemoveProductFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :quantity, :string
  end
end
