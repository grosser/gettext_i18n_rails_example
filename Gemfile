source :rubygems

gem "rails", "~>3.2.0"

gem "sqlite3"
gem "fast_gettext", '>= 0.5'

#only used for mo/po file generation in development, !do not load(:lib=>false)! since it will only eat 7mb ram
gem "gettext", '>= 1.9.3', :require => false

#this is needed for language/country translations
gem "countries_and_languages", '>=0.1.2', :require => 'countries_and_languages/rails'

#templating engines
gem "haml"
gem "ruby_parser", :require => false
gem "slim"

group :test do
  gem 'rspec', '>=2'
  gem 'rspec-rails', '>=2'
end
