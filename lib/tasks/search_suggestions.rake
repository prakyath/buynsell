namespace :search_suggestions do
    desc :"generate search suggestions from products"
    task :index => :environment do
        SearchSuggestion.index_products
    end
end