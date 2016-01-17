class AddForeignIdToNotificationOffer < ActiveRecord::Migration
  def change
    add_column :notification_offers, :notifier_id, :integer
    add_column :notification_offers, :notifiee_id, :integer
  end
end
