class Product < ActiveRecord::Base
	has_one :user
	has_many :comments
	has_attached_file :image , :styles => {:small => '150x150>'} 
end
