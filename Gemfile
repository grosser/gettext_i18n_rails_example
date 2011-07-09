# include at least one source and the rails gem
source :rubygems
gem 'rails', '2.3.12', :require => nil
gem 'sqlite3-ruby', :require => 'sqlite3'
gem 'fast_gettext', '>=0.4.8'
gem 'rdoc'

# for language/country translations
gem 'i18n_data'

group :development do
  # only used for mo/po file generation in development, not required since it will only eat 7mb ram
  gem 'gettext', :require => false
end

group :test do
  # bundler requires these gems while running tests
  gem 'rspec', '~>1'
  gem 'rspec-rails', '~>1'
end
