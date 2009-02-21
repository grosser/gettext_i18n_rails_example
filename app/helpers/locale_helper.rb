module LocaleHelper
  include FastGettext::Translation
  def relative_time_in_words(time)
    _("%{relative_time} ago") % {:relative_time => time_ago_in_words(time)}
  end
end