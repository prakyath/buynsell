class Product < ActiveRecord::Base
	belongs_to :user
	has_many :comments , dependent: :destroy
	has_attached_file :image ,:styles => {
  :thumb    => ['100x100#',  :jpg, :quality => 70],
  :preview  => ['480x480#',  :jpg, :quality => 70],
  :large    => ['600>',      :jpg, :quality => 70],
  :retina   => ['1200>',     :jpg, :quality => 30]
},
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
	accepts_nested_attributes_for :image , :reject_if => lambda { |t| t['image'].nil? }
end
