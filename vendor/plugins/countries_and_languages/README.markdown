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

DEMO can be found in [Gettext example application](http://github.com/grosser/gettext_i18n_rails_example)

Setup
=====
    script/plugin install git://github.com/grosser/countries_and_languages.git

    #environment.rb
    Rails::Initializer.run do |config|
      ...
      config.gem "i18n_data"
    end

Author
======
[Michael Grosser](http://pragmatig.wordpress.com)  
grosser.michael@gmail.com  
Hereby placed under public domain, do what you want, just do not hold me accountable...  