# ---- requirements
$LOAD_PATH << File.expand_path("../lib", File.dirname(__FILE__))
require 'active_support'
require 'action_controller'
gem 'grosser-i18n_data', '>=0.2.3'
require 'i18n_data'
require 'countries_and_languages'

# ---- Helpers
def pending_it(text,&block)
  it text do
    pending(&block)
  end
end