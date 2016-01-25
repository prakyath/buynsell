class DropTables < ActiveRecord::Migration
  def change
    drop_table :product_images
    drop_table :product_followers
    add_column :products, :pictures, :json

  end
end
