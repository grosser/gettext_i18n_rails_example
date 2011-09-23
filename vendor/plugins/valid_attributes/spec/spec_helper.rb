require 'rubygems'
require 'spec'
require 'spec/setup_test_model'

$LOAD_PATH << 'lib'

# fake rails being present
class Rails
  def self.env
    'test'
  end
end
require 'init'