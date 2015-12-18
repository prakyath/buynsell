class Category < ActiveRecord::Base
	has_many :products, dependent: :nullify
	has_many :ads
end
