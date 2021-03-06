# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Dentist
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Brazilian datetime and lang
    config.time_zone = 'Brasilia'
    config.active_record.default_timezone = :utc
    config.i18n.default_locale = :'pt-BR'

    # Field with errors at validation
    config.action_view.field_error_proc = proc { |html_tag, _instance|
      "<div class=\"field_with_errors control-group error\">#{html_tag}</div>".html_safe
    }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
