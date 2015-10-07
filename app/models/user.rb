class User < ActiveRecord::Base
	establish_connection :students_1415
	has_many :products,dependent: :destroy
	has_many :comments,dependent: :destroy
end
