class Picture < ActiveRecord::Base
  belongs_to :product

  has_attached_file :image,
    :styles => { :small => "100x100#", :medium=>"250x250#",:large => "500x500>" },
    :path => ":rails_root/public/images/:id/:style/:filename",
    :url  => "/images/:id/:filename"
validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end