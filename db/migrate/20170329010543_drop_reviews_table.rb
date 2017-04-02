class DropReviewsTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :reviews
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
