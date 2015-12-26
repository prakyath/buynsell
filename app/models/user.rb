class User < ActiveRecord::Base
	establish_connection :students_1415
	has_many :products,dependent: :destroy
	has_many :comments,dependent: :destroy
	has_many :ads,dependent: :destroy
 	has_many :notifications_as_notifier, :class_name=>'Notification', :foreign_key=>'notifier_id'
    has_many :notifications_as_notifiee, :class_name=>'Notification', :foreign_key=>'notifiee_id'
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
     
end
