class ChangeRatingToInteger < ActiveRecord::Migration[5.0]
  def change
    # change_column :markets, :rating, :integer
    # change_column :reviews, :rating, :integer

    change_column :markets, :rating, 'integer USING CAST(rating AS integer)'
    change_column :reviews, :rating, 'integer USING CAST(rating AS integer)'
  end
end
