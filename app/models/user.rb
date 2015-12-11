class User < ActiveRecord::Base
	establish_connection :students_1415
	has_many :products,dependent: :destroy
	has_many :comments,dependent: :destroy
	has_many :ads,dependent: :destroy
 	has_many :notifications_as_notifier, :class_name=>'Notification', :foreign_key=>'notifier_id'
    has_many :notifications_as_notifiee, :class_name=>'Notification', :foreign_key=>'notifiee_id'
end
