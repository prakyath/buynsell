class AddColumnToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :message, :string
    add_column :notifications, :product_id, :integer
    add_column :notifications, :comment_id, :integer
  end
end
