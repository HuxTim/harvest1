class RemoveStateFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :state, :string
  end
end
