require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module LugatexboardRails
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.cache_store = :redis_store, 'redis://127.0.0.1:6379/0/cache', { expires_in: 90.minutes }
  end
end
