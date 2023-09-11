# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
require 'sidekiq/web'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    config.load_defaults 7.0

    config.active_job.queue_adapter = :sidekiq
    config.log_level = :debug

    config.assets.paths << Rails.root.join("app", "assets", "fonts")
  end
end
