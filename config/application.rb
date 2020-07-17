require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module InTheKitchen
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    

    # Added lines below after updating to Rails 6 and hit error with module Indexable not being included. Answer found here https://stackoverflow.com/questions/17007685/rails-4-uninitialized-constant-for-module/17007968
    # config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths << "#{Rails.root}/lib"
	config.eager_load_paths << "#{Rails.root}/lib"
  end
end
