require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module BookTicket
  class Application < Rails::Application
    config.load_defaults 5.1

    config.assets.paths << Rails.root.join("vendor", "assets")

    config.i18n.load_path +=
      Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}").to_s]
    config.i18n.available_locales = [:en, :vi]
    config.i18n.default_locale = :en

  end
end
