class RemoveCityFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :city, :string
  end
end
