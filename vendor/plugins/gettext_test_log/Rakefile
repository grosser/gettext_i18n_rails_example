require 'rubygems'

desc "Run all specs in spec directory"
task :default do |t|
  options = "--colour --format progress --loadby --reverse"
  files = FileList['spec/**/*_spec.rb']
  system("spec #{options} #{files}")
end

#Gemspec
begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "gettext_test_log"
    gem.summary = "Logs all gettext translations during test execution, to a GetText readable format"
    gem.email = "grosser.michael@gmail.com"
    gem.homepage = "http://github.com/grosser/gettext_test_log"
    gem.authors = ["Michael Grosser"]
    gem.files += (FileList["{lib,spec}/**/*"] + FileList["VERSION.yml"] + FileList["README.markdown"]).to_a.sort
  end
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end