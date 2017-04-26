class AddRequestTable < ActiveRecord::Migration[5.0]
  def up
    create_table :requests do |t|
      t.integer :store_id
      t.integer :market_id
      t.integer :status
      t.timestamps
    end
  end

  def down
    drop_table :requests
  end
end
