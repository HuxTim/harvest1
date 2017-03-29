class ChangeRatingToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :markets, :rating, :integer
    change_column :reviews, :rating, :integer
  end
end
