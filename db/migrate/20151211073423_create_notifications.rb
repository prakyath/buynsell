class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :notifier_id
      t.integer :notifiee_id

      t.timestamps null: false
    end
  end
end
