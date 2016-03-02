class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|

      t.timestamps null: false
      add_reference :products, :category
    end
  end
end
