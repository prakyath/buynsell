class Product < ActiveRecord::Base
	belongs_to :user
  belongs_to :category
	has_many :comments , dependent: :destroy
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

#	validates_attachment_presence :image
#	validates_attachment_size :image , :less_than => 10.megabytes
	#validates_attachment_content_type :image , :content_type => ['image/jpeg','image/jpg','image/png']
	#validates :image, presence: true 
#	accepts_nested_attributes_for :product , :reject_if => lambda { |t| t['image'].nil? }
end
