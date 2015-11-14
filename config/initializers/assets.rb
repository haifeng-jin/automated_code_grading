# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( bootstrap-cerulean.min.css )
Rails.application.config.assets.precompile += %w( charisma-app.css )
Rails.application.config.assets.precompile += %w( jquery.noty.css )
Rails.application.config.assets.precompile += %w( noty_theme_default.css )
Rails.application.config.assets.precompile += %w( elfinder.min.css )
Rails.application.config.assets.precompile += %w( elfinder.theme.css )
Rails.application.config.assets.precompile += %w( jquery.iphone.toggle.css )
Rails.application.config.assets.precompile += %w( uploadify.css )
Rails.application.config.assets.precompile += %w( animate.min.css )
Rails.application.config.assets.precompile += %w( jquery.dataTables.min.js )

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
