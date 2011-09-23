require 'rubygems'

task :default do
  sh "bundle exec rspec spec"
end

#Gemspec
begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "gettext_test_log"
    gem.summary = "Logs all gettext translations during test execution, to a GetText readable format"
    gem.email = "grosser.michael@gmail.com"
    gem.homepage = "http://github.com/grosser/#{gem.name}"
    gem.authors = ["Michael Grosser"]
  end
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: gem install jeweler"
end
