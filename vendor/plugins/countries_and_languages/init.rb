require 'countries_and_languages'
ActionView::Base.send(:include,CountriesAndLanguages::Helpers)