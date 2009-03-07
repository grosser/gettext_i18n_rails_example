module CountriesAndLanguages
  def countries
    @@countries ||= {}
    @@countries[I18n.locale] ||= I18nData.countries(I18n.locale.to_s.upcase).to_a.sort_by(&:last).map(&:reverse)
  end

  def country(country_code)
    countries.rassoc(country_code.to_s.upcase)[0] rescue ''
  end

  def languages
    @@languages ||= {}
    @@languages[I18n.locale] ||= I18nData.languages(I18n.locale.to_s.upcase).to_a.sort_by(&:last).map(&:reverse)
  end

  def language(language_code)
    languages.rassoc(language_code.to_s.upcase)[0] rescue ''
  end
end