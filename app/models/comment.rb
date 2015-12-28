class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :product
	belongs_to :ad
	has_many :notifications, dependent: :destroy
	validates :message,:presence => true,:length => {:maximum => 600, :message => 'too long...'},allow_blank: false
end
