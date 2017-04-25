class AddIsSpecialToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :is_special, :boolean
  end
end
