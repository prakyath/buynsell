class Product < ActiveRecord::Base
	belongs_to :user
  belongs_to :category
	has_many :comments , dependent: :destroy
	has_many :product_followers, dependent: :destroy
	has_many :followers ,:through => :product_followers
	has_many :inverse_product_followers, :class_name => "ProductFollower" , :foreign_key => "follower_id"
	has_many :inverse_followers ,:through => :inverse_product_followers ,:source => :prodoct
	has_attached_file :image ,:styles => {
  :thumb    => ['100x100#',  :jpg, :quality => 70],
  :preview  => ['480x480#',  :jpg, :quality => 70],
  :large    => ['600>',      :jpg, :quality => 70],
  :retina   => ['1200>',     :jpg, :quality => 30]
},:path => ':rails_root/public/system/:id.:extension',
:convert_options => {
  :thumb    => '-set colorspace sRGB -strip',
  :preview  => '-set colorspace sRGB -strip',
  :large    => '-set colorspace sRGB -strip',
  :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
}
  validates_attachment_presence :image
	validates_attachment_size :image , :less_than => 10.megabytes
	validates_attachment_content_type :image , :content_type => ['image/jpeg','image/jpg','image/png']
	validates :image, presence: true 
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

#	validates_attachment_presence :image
#	validates_attachment_size :image , :less_than => 10.megabytes
	#validates_attachment_content_type :image , :content_type => ['image/jpeg','image/jpg','image/png']
	#validates :image, presence: true 
#	accepts_nested_attributes_for :product , :reject_if => lambda { |t| t['image'].nil? }

def self.search(query)
  where("name like ?", "%#{query}%") 
end

end
