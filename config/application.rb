require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SubsidyCheckerApp
  class Application < Rails::Application

    config.load_defaults 6.0
    # config.i18n.default_locales = %i[ja en]
    config.i18n.default_locale = :ja
    config.time_zone = "Tokyo"
    
    config.generators do |g|
      g.test_framework(
        :rspec,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        request_specs: false
      )
        
    end
  end
end
