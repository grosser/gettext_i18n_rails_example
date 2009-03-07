require File.expand_path("spec_helper", File.dirname(__FILE__))

include CountriesAndLanguages::Helpers

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

  describe 'clean names' do
    it "removes everything in braces" do
      country('va').should == 'Holy See'
      language('IA').should == 'Interlingua'
    end
    it "removes everything behind comma" do
      country('IR').should == 'Iran'
      language('ND').should == 'Ndebele'
    end
    it "removes everything behind semicolon" do
      language('nb').should == 'Bokmål'
      language('ca').should == 'Catalan'
    end
  end

  it "sorts umlaut-aware" do
    I18n.locale = :de
    countries[1][0].should == 'Ägypten'
  end

  describe 'misc fixes' do
    describe 'German' do
      before {I18n.locale = :de}
      it "removes -Sprache aditions" do
        language('ZU').should == "Zulu"
      end
      it "knows Kongo" do
        country('CD').should == 'Kongo'
      end
      it "knows Lao" do
        country('LA').should == 'Lao'
      end
    end
  end

  describe :select_tag do
    def h
      ActionController::Base.helpers
    end

    it "can use countries for a select tag" do
      select = h.select_tag('x',h.options_for_select(countries))
      select.split("\n").last.should == %Q[<option value=\"ZW\">Zimbabwe</option></select>]
    end

    it "can use languages for a select tag" do
      select = h.select_tag('x',h.options_for_select(languages))
      select.split("\n").last.should == %Q[<option value=\"ZU\">Zulu</option></select>]
    end
  end
end