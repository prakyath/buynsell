class CreateProductFollowers < ActiveRecord::Migration
  def change
    create_table :product_followers do |t|
      t.integer :product_id
      t.integer :follower_id

      t.timestamps null: false
    end
  end
end
