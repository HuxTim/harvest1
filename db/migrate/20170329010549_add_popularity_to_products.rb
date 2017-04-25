class AddPopularityToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :popularity, :integer
  end
end
