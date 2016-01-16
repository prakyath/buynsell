class Bids < ActiveRecord::Migration
  def change
  	create_table :bids do |t|
      t.integer :price
      t.text :content
      t.integer :user_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
