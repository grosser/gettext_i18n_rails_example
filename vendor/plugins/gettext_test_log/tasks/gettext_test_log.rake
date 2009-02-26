namespace :gettext do
  desc "write all msgids used into testlog_phrases.rb"
  task :test_log => :environment do
    GettextTestLog::write_test_log("locale/testlog_phrases.rb")
  end
end