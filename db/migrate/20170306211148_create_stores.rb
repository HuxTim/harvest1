class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :description
      t.string :open_time
      t.string :close_time

      t.timestamps
    end
  end
end
