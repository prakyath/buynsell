class Product < ActiveRecord::Base
	belongs_to :user
  belongs_to :category
  belongs_to :oauth
	has_many :comments , dependent: :destroy
  has_many :pictures, :dependent => :destroy
  accepts_nested_attributes_for :pictures 
def self.search(query)
  where("name like ?", "%#{query}%") 
end

end
