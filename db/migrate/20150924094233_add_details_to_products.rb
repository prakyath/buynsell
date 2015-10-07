class AddDetailsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :name, :string
    add_column :products, :price, :integer
    add_column :products, :description, :text
    add_column :products, :reason, :text
    add_column :products, :user_id, :integer

    add_column :products, :image_file_name, :string
    add_column :products, :image_content_type, :string
    add_column :products, :image_file_size, :integer
    add_column :products, :image_updated_at, :datetime
    remove_column :products, :image_file_name, :string
    remove_column :products, :image_content_type, :string
    remove_column :products, :image_file_size, :integer
    remove_column :products, :image_updated_at, :datetime
  end
end
