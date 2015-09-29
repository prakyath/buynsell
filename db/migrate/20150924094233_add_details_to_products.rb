class AddDetailsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :name, :string
    add_column :products, :price, :integer
    add_column :products, :description, :text
    add_column :products, :reason, :text
    add_column :products, :user_id, :integer
  end
end
