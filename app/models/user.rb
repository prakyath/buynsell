class User < ActiveRecord::Base
	establish_connection :students_1415
	has_many :products,dependent: :destroy
	has_many :comments,dependent: :destroy
	has_many :ads,dependent: :destroy
 	has_many :notifications_as_notifier, :class_name=>'Notification', :foreign_key=>'notifier_id'
    has_many :notifications_as_notifiee, :class_name=>'Notification', :foreign_key=>'notifiee_id'
  has_attached_file :avatar,
    :styles => { :small => "100x100#", :medium=>"250x250#",:large => "500x500>" },
    :path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename"
    do_not_validate_attachment_file_type :avatar

end
