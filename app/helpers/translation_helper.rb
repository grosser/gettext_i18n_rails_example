module TranslationHelper
  def relative_time_in_words(time)
    _("%{relative_time} ago") % {:relative_time => time_ago_in_words(time)}
  end

  def months
    t('date.month_names')
  end

  def month(i)
    return '' unless i
    i = i.to_time.month if i.respond_to? :to_time
    months[i]
  end
end