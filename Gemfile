source 'http://gemcutter.org'

gem "rails", "3.0.0.beta"

gem "sqlite3-ruby", :require => "sqlite3"
gem "fast_gettext", :version => '>= 0.5'

#only used for mo/po file generation in development, !do not load(:lib=>false)! since it will only eat 7mb ram
gem "gettext", :require => false, :version => '>= 1.9.3'

#this is needed for language/country translations
gem "i18n_data", :require => 'i18n_data', :version => '>= 0.2.5'

group :test do
  gem "rspec"
end