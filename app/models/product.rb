class Product < ActiveRecord::Base
	has_one :user
	has_many :comments
	has_attached_file :image , :styles => {:small => '150x150>'} 

	validates_attachment_presence :image
	validates_attachment_size :image , :lessthan => 10.megabytes
	validates_attachment_content_type :image , :content_type => ['image/jpeg','image/jpg','image/png']
end
