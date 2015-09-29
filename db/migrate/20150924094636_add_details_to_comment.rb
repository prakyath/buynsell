class AddDetailsToComment < ActiveRecord::Migration
  def change
    add_column :comments, :bid, :integer
    add_column :comments, :message, :text
    add_column :comments, :user_id, :integer
    add_column :comments, :product_id, :integer
  end
end
