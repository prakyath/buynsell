class Product < ActiveRecord::Base
	has_one :user
	has_many :comments
	has_attached_file :image
end
