class RemoveDescriptionFromVendors < ActiveRecord::Migration[5.0]
  def change
    remove_column :vendors, :description, :string
  end
end
