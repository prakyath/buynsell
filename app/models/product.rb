class Product < ActiveRecord::Base
	belongs_to :user
  belongs_to :category
  belongs_to :oauth
	has_many :comments , dependent: :destroy
  has_many :pictures, :dependent => :destroy
def self.search(query)
  where("name like ?", "%#{query}%") 
end

end
