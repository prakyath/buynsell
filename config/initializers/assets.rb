# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile +=  ['*.js', '*.css.erb','*.scss'] 
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( jquery.fancybox.css )
#Rails.application.config.assets.precompile += %w( jquery.fancybox.js )
#Rails.application.config.assets.precompile += %w( jquery.fancybox.pack.js )
Rails.application.config.assets.precompile += %w( '*' )
Rails.application.config.assets.precompile +=  ['*.jpg','*.jpeg','*.png']
Rails.application.config.assets.precompile += %w( *.svg *.eot *.woff *.ttf )
