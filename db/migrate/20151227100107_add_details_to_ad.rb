class AddDetailsToAd < ActiveRecord::Migration
  def change
    add_column :ads, :category_id, :integer
    add_column :ads, :Ad, :text
  end
end
