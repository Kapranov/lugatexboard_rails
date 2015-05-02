# Rails.application.config.session_store :cookie_store, key: '_lugatexboard_rails_session'
# MyApplication::Application.config.session_store :redis_store, servers: 'redis://localhost:6379/0/cache'
LugatexboardRails::Application.config.session_store :redis_store, servers: 'redis://127.0.0.1:6379/0/cache'
