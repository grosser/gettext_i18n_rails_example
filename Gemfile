source "https://rubygems.org"

ruby File.read('.ruby-version').strip

gem "rails", "~>3.2.0"
gem "sqlite3", "~> 1.3.5"
gem "test-unit"

gem "pg"
gem "fast_gettext", '>= 0.5'

#only used for mo/po file generation in development, !do not load(:lib=>false)! since it will only eat 7mb ram
gem "gettext", '>= 3.0.2', :require => false

#this is needed for language/country translations
gem "countries_and_languages", '>=0.1.2', :require => 'countries_and_languages/rails'

#templating engines
gem "haml"
gem "ruby_parser", :require => false
gem "slim"
gem "gettext_i18n_rails"#, :path => "~/code/tools/gettext_i18n_rails"
gem "thin"
# gem "debugger", :require => nil

group :test do
  gem 'rspec', '>=2'
  gem 'rspec-rails', '>=2'
end
