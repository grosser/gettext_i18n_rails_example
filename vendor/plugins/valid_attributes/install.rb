def recursive_mk_dir(path)
  require 'fileutils'
  FileUtils.mkdir_p(path)
end

#load Grosser::Valid
#make the normal init.rb useable
here = __FILE__
4.times{here = File.dirname(here)}
RAILS_ROOT = here
RAILS_ENV='test'
require File.join(File.dirname(__FILE__),'init')

path = Grosser::Valid.path_to_valid_yml
unless File.exist?(path)
  recursive_mk_dir File.dirname(path)
  File.open(path,'w') do |f|
    f.puts 'User'
    f.puts '  name: Hans'
    f.puts '  login: hans'
    f.puts '  fill_out: the rest...'
  end
  
  puts "Created: #{path}"
else
  puts "Exists: #{path}"
end