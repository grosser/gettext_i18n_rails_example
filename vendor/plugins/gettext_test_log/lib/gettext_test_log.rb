module GettextTestLog
  extend self
  SEPERATOR = "\nNEXT-WORD\n"

  # write to a given file, which msgids where found
  # in the `rake updatepo` recogniseable format _("msgid")
  def write_test_log(storage_file,options={})
    messages = messages_from_test_run
    if excluded = options[:exclude_msgids_in_po_files]
      messages -= msgids_in_po_files(excluded)
    end
    store_messages(messages,storage_file)
  end

  # call this inside your spec_helper.rb
  # to activate test message storage
  def activate_test_logging
    if ENV['LOG_GETTEXT']
      require 'gettext_test_log/fast_gettext_stub'
      Spec::Runner.configure do |config|
        #TODO only call after the 'last' test was executed
        config.after(:all) do
          File.open(ENV['LOG_GETTEXT'],'w') do |f|
            f.puts FastGettext::Translation::TRANSLATIONS_USED * SEPERATOR
          end
        end
      end
    end
  end

private

  def messages_from_test_run
    logfile = 'tmp_gettext_test_log.txt'
    run_tests(logfile)
    ids = used_msgids(logfile)
    `rm #{logfile}`
    ids
  end

  def used_msgids(logfile)
    File.read(logfile).split(/#{SEPERATOR}/m).map(&:strip).reject(&:blank?).uniq
  end

  def run_tests(logfile)
    ENV['LOG_GETTEXT']=logfile
    Rake::Task["spec"].invoke rescue nil
  end

  def msgids_in_po_files(files)
    [*files].map{|file| messages_from_po_file(file).keys}.flatten
  end

  #returns a hash of all msgid => msgstr
  def messages_from_po_file(file)
    require 'gettext'
    require 'gettext/poparser'
    require 'gettext/mofile'
    data = MOFile.new
    GetText::PoParser.new.parse(File.read(file),data)
    data
  end

  def store_messages(messages,file)
    File.open(file,'w') do |f|
      f.puts "#GENERATED FILE DO NOT MODIFY"
      f.puts messages.uniq.sort.map{|message| %Q[_("#{message}")].gsub("\n","\\n")} * "\n"
      f.puts "#GENERATED FILE DO NOT MODIFY"
    end
  end
end