class AddColumnToComment < ActiveRecord::Migration
  def change
    add_column :comments, :notification_id, :integer
  end
end
