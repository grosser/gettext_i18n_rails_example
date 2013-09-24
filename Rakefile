# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

require 'rake'
require 'rake/testtask'
require 'rdoc/task'

GettextExampleRails::Application.load_tasks

task :default do
  sh "rspec spec"
end

prerequisites = Rake::Task["gettext:find"].prerequisites
prerequisites.unshift "auto_change"

desc "make sure gettext:find generates new pot/po files"
task :auto_change do
  sh "touch locale/testlog_phrases.rb"
end

