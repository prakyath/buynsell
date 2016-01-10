class ProductFollower < ActiveRecord::Base
    belongs_to :product
    belongs_to :follower , :class_name => "Product"
end
