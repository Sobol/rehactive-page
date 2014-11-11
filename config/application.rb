require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env)

module RehactivePage
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Use SQL instead of Active Record's schema dumper when creating the database.
    # This is necessary if your schema can't be completely dumped by the schema dumper,
    # like if you have constraints or database-specific column types
    # config.active_record.schema_format = :sql

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'
    config.assets.initialize_on_precompile = false
    config.active_record.whitelist_attributes = false
    config.assets.precompile += %w(
      admin.css
      ckeditor/*
      *.eot *.woff *.ttf *.svg
      *.eps
      *.png *.jpg *.gif *.webp
      *.cur *.htc *.swf
    )

    config.paperclip_defaults = {
      :storage => :s3,
      :url => ':s3_alias_url',
      :s3_protocol => 'http',
      :s3_host_alias => ENV["S3_HOST"],
      :s3_headers => {
        :cache_control => "max-age=#{364.days.to_i}",
      },
      :s3_permissions => :public_read,
      :processors => [:thumbnail, :image_compressor],
      :convert_options => {
        all: "-quality 75"
      },
      :use_timestamp => false,
      :s3_credentials => {
        :bucket => ENV["S3_BUCKET_NAME"],
        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
      }
    }
  end
end
