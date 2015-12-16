class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :product
	has_many :notifications, dependent: :destroy
end
