module CountriesAndLanguages
  extend self

  module Helpers
    def countries
      @@countries ||= {}
      @@countries[I18n.locale] ||= CountriesAndLanguages.clean_and_sort(I18nData.countries(I18n.locale.to_s.upcase))
    end

    def country(country_code)
      countries.rassoc(country_code.to_s.upcase)[0] rescue ''
    end

    def languages
      @@languages ||= {}
      @@languages[I18n.locale] ||= CountriesAndLanguages.clean_and_sort(I18nData.languages(I18n.locale.to_s.upcase))
    end

    def language(language_code)
      languages.rassoc(language_code.to_s.upcase)[0] rescue ''
    end
  end

  def clean_and_sort(data)
    data = data.to_a.sort_by{|code,name| convert_umlaut_to_base(name)}
    data.map!{|code,name|[clean_name(name),code]}
  end

  def clean_name(name)
    #General fixes
    name = name.sub(/\s*[,;(].*/,'')

    #German fixes
    name.sub!(/-Sprache$/,'')
    name.sub!(/ Peoples Democratic Republics Democratic Republic/,'')#Lao
    name.sub!(/Demokratische Republik /,'')#Congo

    name
  end

  def convert_umlaut_to_base(input)
    $KCODE='u'
    %w(aáä AÁÄÅ oóö OÓÖ ií IÍ uúü UÚÜ eé EÉ sß).inject(input.dup) do |input, set|
      to, *from = set.split('')
      input.gsub(/[#{from}]/, to)
    end
  end
end