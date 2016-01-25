class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|

      t.timestamps null: false
    end
    create_table :products do |t|
      add_column :products, :pictures, :json
  end
end
