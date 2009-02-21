# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include FastGettext::Translation
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  before_filter :set_gettext_locale
  def set_gettext_locale
    FastGettext.text_domain= 'app'
    FastGettext.available_locales = ['en','de']
    super
  end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end