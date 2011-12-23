$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
name = 'countries_and_languages'
require "#{name}/version"

Gem::Specification.new name, CountriesAndLanguages::VERSION do |s|
  s.summary = "Countries and languages in I18n.locale for select_tag or output in 85 languages"
  s.authors = ["Michael Grosser"]
  s.email = "michael@grosser.it"
  s.homepage = "http://github.com/grosser/#{name}"
  s.files = `git ls-files`.split("\n")
  s.add_dependency 'i18n_data'
end
