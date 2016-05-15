# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( login/manifest.css )
Rails.application.config.assets.precompile += %w( login/cover.css )

Rails.application.config.assets.precompile += %w( main/manifest.css )
Rails.application.config.assets.precompile += %w( main/aclx.css )
Rails.application.config.assets.precompile += %w( main/car_shows.scss )
Rails.application.config.assets.precompile += %w( main/scaffolds.scss )
Rails.application.config.assets.precompile += %w( main/vehicles.scss )

Rails.application.config.assets.precompile += %w( tether.min.js )
Rails.application.config.assets.precompile += %w( bootstrap.min.js )

