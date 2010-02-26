Run it
======
    sudo gem install bundler
    bundle install
    rails server
    visit http://localhost:3000

How to repeat this setup
========================

Follow instructions from [gettext_i18n_rails](http://github.com/grosser/gettext_i18n_rails)

###Find all translations
translations used while testing
    rake gettext:test_log
translations for model names/attributes + thrugh gettext-ruby-parser
    rake gettext:find
Convert them to FastGettext readable format
    rake gettext:pack

You can see this app running (rails 2.3 version) [online Demo](http://gettext-i18n-rails-example.heroku.com/)