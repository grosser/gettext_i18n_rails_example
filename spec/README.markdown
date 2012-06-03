This are no real tests, but simply tests for the I18n features.

Steps to repeat
===============
rspec + rspec-rails edge

[Valid attributes](http://github.com/grosser/valid_attributes)
    script/plugin install git://github.com/grosser/valid_attributes.git
    edit spec/valid_attributes.yml

[Gettext test log](http://github.com/grosser/gettext_test_log)
    script/plugin install git://github.com/grosser/gettext_test_log.git
    create lib/tasks/gettext_test_log.rake
