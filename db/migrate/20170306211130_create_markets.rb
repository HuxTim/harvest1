class CreateMarkets < ActiveRecord::Migration[5.0]
  def change
    create_table :markets do |t|
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :rating
      t.string :description
      t.string :open_time
      t.string :close_time

      t.timestamps
    end
  end
end
