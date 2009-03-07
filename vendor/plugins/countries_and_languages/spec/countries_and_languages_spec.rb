require File.expand_path("spec_helper", File.dirname(__FILE__))

include CountriesAndLanguages

describe CountriesAndLanguages do
  before do
    I18n.locale = :en
  end

  {:country=>['Germany','Deutschland'],:language=>['German','Deutsch']}.each do |method,translation|
    it "translates #{method}" do
      send(method,'DE').should == translation[0]
      I18n.locale = :de
      send(method,'DE').should == translation[1]
    end

    it "returns blank when not found" do
      send(method,'XC').should be_blank
    end
  end

  describe :select_tag do
    def h
      ActionController::Base.helpers
    end

    it "can use countries for a select tag" do
      select = h.select_tag('x',h.options_for_select(countries))
      select.split("\n").last.should == %Q[<option value=\"AX\">Åland Islands</option></select>]
    end

    it "can use languages for a select tag" do
      select = h.select_tag('x',h.options_for_select(languages))
      select.split("\n").last.should == %Q[<option value=\"ZU\">Zulu</option></select>]
    end
  end
end