How to repeat this setup
========================
 - `sudo gem install rails -s http://gems.rubyonrails.org`
 - environment.rb: config.action_controller.session = { :key => "_myapp_session", :secret => "some secret phrase" }
 - add new model via ./script/generate scaffold car
 - rake db:migrate
 - follow instructions from [gettext_i18n_rails](http://github.com/grosser/gettext_i18n_rails)

