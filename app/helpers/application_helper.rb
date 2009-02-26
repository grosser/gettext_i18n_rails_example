# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def current_url(params={})
    url_for :only_path=>false, :overwrite_params=>params
  end
end
