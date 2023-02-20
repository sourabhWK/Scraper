# frozen_string_literal: true

require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

Dotenv::Railtie.load if %w[development test].include? ENV['RAILS_ENV']

module Scraper
  # This is a top level comment for this file
  class Application < Rails::Application
    config.load_defaults 7.0
  end
end
