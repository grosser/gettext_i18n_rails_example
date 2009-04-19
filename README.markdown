How to repeat this setup
========================
 - `sudo gem install rails -s http://gems.rubyonrails.org`
 - add new model via ./script/generate scaffold car
 - rake db:migrate
 - follow instructions from [gettext_i18n_rails](http://github.com/grosser/gettext_i18n_rails)

###Find all translations
translations used while testing (tests may crash if you do not have rspec+rspec-rails edge!)
    rake gettext:test_log
translations for model names/attributes + thrugh gettext-ruby-parser
    rake gettext:find
Convert them to FastGettext readable format
    rake gettext:pack

You can see this app running at http://blooming-stone-47.heroku.com/
