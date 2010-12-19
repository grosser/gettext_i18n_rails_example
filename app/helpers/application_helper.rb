# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def current_url(extra_params={})
    url_for params.merge(extra_params)
  end
end
