source 'http://rubygems.org'

gem "rails", "~>3.1.0"

gem "sqlite3-ruby", :require => "sqlite3"
gem "fast_gettext", '>= 0.5'

#only used for mo/po file generation in development, !do not load(:lib=>false)! since it will only eat 7mb ram
gem "gettext", '>= 1.9.3', :require => false

#this is needed for language/country translations
gem "i18n_data", '>= 0.2.6', :require => 'i18n_data'

group :test do
  gem 'rspec', '>=2'
  gem 'rspec-rails', '>=2'
end
