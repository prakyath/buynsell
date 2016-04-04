class AddFieldsToNotification < ActiveRecord::Migration
  def change
    add_column :notifications, :Type, :string
  end
end
