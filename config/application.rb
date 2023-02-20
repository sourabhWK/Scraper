require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

if ['development', 'test'].include? ENV['RAILS_ENV']
  Dotenv::Railtie.load
end

module Scraper
  class Application < Rails::Application
    
    config.load_defaults 7.0
    
  end
end
