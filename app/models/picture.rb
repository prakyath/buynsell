class Picture < ActiveRecord::Base
  belongs_to :product
  has_attached_file :image,
    :styles => { :thumb => "100x100#", :small => "250x250#", :medium=>"400x400#",:large => "600x600>" },
    :path => ":rails_root/public/images/Product_Pictures/:id/:style/:filename",
    :url  => "/images/Product_Pictures/:id/:style/:filename"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :image
	validates_attachment_size :image , :less_than => 5.megabytes
	validates :image, presence: true 
end

#medium for zoom galler,thumb for zoom gallery,small from index thumb
#zoom source is medium and zoom target is large