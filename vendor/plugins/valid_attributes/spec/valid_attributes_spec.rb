require "spec/spec_helper"

VALID_ATTRIBUTES_YML = 'spec/valid_attributes.yml'
ValidAttributesHelper.stored_valid_attributes = YAML.load(File.read(VALID_ATTRIBUTES_YML))

describe ValidAttributes do
  include ValidAttributes

  describe :path_to_valid_yml do
    it "builds depending on RAILS_ROOT" do
      Rails.stub!(:root).and_return 'xxx'
      File.stub!(:exist?).and_return true
      ValidAttributesHelper.path_to_valid_yml.should == 'xxx/test/valid_attributes.yml'
    end
  end

  describe :valid_attributes do
    it "loads from valid_attributes.yml" do
      ValidAttributesHelper.stored_valid_attributes = nil
      ValidAttributesHelper.should_receive(:path_to_valid_yml).and_return VALID_ATTRIBUTES_YML
      ValidAttributesHelper.valid_attributes(User)[:name].should == 'Hans'
    end

    it "uses the given stored attributes" do
      valid_attributes(:user)[:name].should == 'Hans'
    end

    it "can use String and Symbol" do
      valid_attributes('user')[:name].should == 'Hans'
      valid_attributes(User)[:name].should == 'Hans'
    end

    it "merges the given attributes" do
      valid_attributes(User,:name=>'Peter')[:name].should == 'Peter'
    end
  end

  describe :valid do
    it "creates a new record with all(even not-accessible) attributes" do
      user = valid User
      valid_attributes(User).each do |field,value|
        user.send(field).should == value
      end
    end

    it "can use String or Symbol" do
      valid('user').attributes.should == valid(User).attributes
      valid(:user).attributes.should == valid(User).attributes
    end

    it "adds given set of attributes(even not-accessible)" do
      changed = {:age=>valid_attributes(User)[:age] + 10,:ugly=>!valid_attributes(User)[:ugly]}
      user = valid User, changed
      changed.each do |field,value|
        user.send(field).should == value
      end
    end
  end

  describe :create_valid do
    it "creates a valid record" do
      user = create_valid User
      user.name.should == 'Hans'
      user.should_not be_new_record
    end

    it "passes values to valid" do
      should_receive(:valid).with(User,:age=>123).and_return User.new(:name=>'Peter')
      create_valid(User,:age=>123)
    end
  end

  describe :assert_invalid_value do
    class VATestException < Exception
    end

    def assert_block(text)
      raise VATestException.new("failed") unless yield
    end

    it "passes for single invalid value" do
      assert_invalid_value(User,:name,nil)
    end

    it "passes for multiple invalid values" do
      assert_invalid_value(User,:name,[nil,''])
    end
    it "fails for multiple valid value" do
      lambda{assert_invalid_value(User,:name,[nil,'Hans'])}.should raise_error(VATestException)
    end
    
    it "builds a readable failure message" do
      should_receive(:assert_block).with do |text|
        text == '<User.name> expected to be invalid when set to <>'
      end
      assert_invalid_value(User,:name,nil)
    end
  end

  describe :assert_invalid_attributes do
    it "calls assert_invalid_value for each set" do
      should_receive(:assert_invalid_value).with(User,:name,['Hans',nil])
      should_receive(:assert_invalid_value).with(User,:age,11)
      assert_invalid_attributes(User,:name=>['Hans',nil],:age=>11)
    end
  end
end