class CreateVendors < ActiveRecord::Migration[5.0]
  def change
    create_table :vendors do |t|
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
