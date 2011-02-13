Rails 3 - gettext_i18n_rails example
====================================

[Rails 2 version](https://github.com/grosser/gettext_i18n_rails_example/tree/rails2)

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

Author
======
[Michael Grosser](http://grosser.it)<br/>
michael@grosser.it<br/>
Hereby placed under public domain, do what you want, just do not hold me accountable...
