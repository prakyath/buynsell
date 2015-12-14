class SearchSuggestion < ActiveRecord::Base
    #attr_accessible :popularity,:term
    
    def self.term_for(prefix)
       suggestions=Where("term LIKE ?","#{prefix}_%")
       suggestions.order("popularity desc").linit(10).pluck(:term)
    end
    
    def self.index_products
       Product.find_each do |product|
          index_term(product.name)
          index_term(product.category)
          product.name.split.each {|t| index_term(t)}
       end
    end
    
    def self.index_term(term)
        where(term: term).first_or_initialize.tap do |suggestion|
            suggestion.increment! :popularity
        end
    end
end
