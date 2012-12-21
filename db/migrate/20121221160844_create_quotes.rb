class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.references :product
      t.references :vendor
      t.decimal :price, :precision => 10, :scale => 2, :default => 0.0
      t.integer :quantity, :default => 0

      t.timestamps
    end
    add_index :quotes, :product_id
    add_index :quotes, :vendor_id
  end
end
