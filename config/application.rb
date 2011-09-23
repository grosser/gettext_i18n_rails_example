require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Auto-require default libraries and those for the current Rails environment.
Bundler.require :default, Rails.env

module GettextExampleRails
  class Application < Rails::Application
    config.time_zone = 'UTC'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
    # config.i18n.default_locale = :de

    # Configure generators values. Many other options are available, be sure to check the documentation.
    # config.generators do |g|
    #   g.orm             :active_record
    #   g.template_engine :erb
    #   g.test_framework  :test_unit, :fixture => true
    # end

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters << :password
    config.secret_token = 'c576773a86e20c6e4f18454dd1a7f16965eff49609a7e5bd05c6cb1bc4ae753e0c86fe978c928d8d4d72d5868f5fa19e7fc782d4c3938c37abf1ac7ebdf91e57'
  end
end

FastGettext.add_text_domain 'app', :path => 'locale'
FastGettext.default_text_domain = 'app'
FastGettext.default_available_locales = ['en','de','pl']
