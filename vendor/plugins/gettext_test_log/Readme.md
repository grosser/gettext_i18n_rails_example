Problem
=======
 - Finding all translations by parsing is impossible for dynamic calls
 - often even static calls are not found
 - some file formats do not have a gettext parser

Solution
========
 - log all translations during test execution
 - write them to an parseable temp file
 - use gettext:find / gettext:pack as usual
 - missing translation = missing test, write tests!

This will only work with [FastGettext](http://github.com/grosser/fast_gettext) and RSpec for now!

Install
=======
 - `rails plugin install git://github.com/grosser/gettext_test_log.git `
 - Gem: `sudo gem install grosser-gettext_test_log -s http://gems.github.com/`

Usage
=====
    rake gettext:test_log

Optionally copy+modify task with options:
    :exclude_msgids_in_po_files=>[
      'some_po_file_that_contains_translations_you_do_not_need.po'
    ]

  Add to your spec_helper:
    #spec/spec_helper.rb
    GettextTestLog::activate_test_logging

  Run:
    rake gettext:test_log
    rake gettext:find  #find new translations
    #fill newly found translations
    rake gettext:pack #write translations

Examples output
===============
    #locale/testlog_phrases.rb
    _("Add to favorites")
    _("Added a subtitle to %{name}")
    _("Additional Information")
    _("Address")
    ...

Unwanted translations
=====================
When using gettext_i18n_rails, most of the columns of a model will be translated during model tests
this can be annoying since normally no user will see them.
To disable this, add to `spec/spec_helper.rb` :
    class ActiveRecord::Base
      def self.human_attribute_name(attr)
        attr.to_s
      end
    end

TODO
====
 - needs tests... :(
 - make compatible with GetText and FastGettext at the same time ?

Author
======
[Michael Grosser](http://grosser.it)<br/>
michael@grosser.it<br/>
Hereby placed under public domain, do what you want, just do not hold me accountable...
