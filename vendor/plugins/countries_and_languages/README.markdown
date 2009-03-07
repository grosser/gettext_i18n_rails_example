Countries and languages in I18n.locale
======================================
In currently 85 languages supplied by [I18nData](http://github.com/grosser/i18n_data).  
Languages and countries are stored as iso 639/iso 3166 - 2 letter code.  
Methods are available in views.

    @user.country == 'de'
    @user.language == 'de'

    User is from <%=country(@user.country)%> and speaks <%=language(@user.language)%>
    User is from Germany and speaks German.

    Please select you language <%=f.select_tag(:language,options_for_select(languages))%>
    Select box with all 185 localized languages.

If you have special needs like renaming countries or only displaying a subset,
have a look at the code and overwrite as necessary.

Setup
=====
    script/plugin install git://github.com/grosser/countries_and_languages.git

    #environment.rb
    Rails::Initializer.run do |config|
      ...
      config.gem "grosser-i18n_data", :lib => 'i18n_data', :version => '0.2.3', :source=>"http://gems.github.com/"
    end

TODO
====
 - Cleanup, some languages have long (albeit political correct) names, maybe through i18n_data patch...
 - Sort Ä after A / Ö after O

Author
======
Michael Grosser  
grosser.michael@gmail.com  
Hereby placed under public domain, do what you want, just do not hold me accountable...  