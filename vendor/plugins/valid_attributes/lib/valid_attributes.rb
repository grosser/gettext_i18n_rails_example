module ValidAttributes
  # create a valid new record
  # attributes are set separetly(no mass-assignment)
  # valid User or valid 'user' or valid User, :name=>'Peter'
  def valid(type,attributes={})
    klas = type.to_s.camelcase.constantize
    record = klas.new
    valid_attributes(klas.to_s.underscore).merge(attributes).each do |field,value|
      record.send("#{field}=",value)
    end
    record
  end

  def create_valid(type,attributes={})
    record = valid(type,attributes)
    record.save!
    record
  end

  def valid_attributes(record_name,attributes={})
    ValidAttributesHelper.valid_attributes(record_name).merge(attributes.to_options)
  end

  #example: User, :login=>['',nil,'admin'], :email=>['',nil,'aa','@','a@','@a']
  def assert_invalid_attributes(model_class, attributes)
    attributes.each_pair do |attribute, value|
      assert_invalid_value model_class, attribute, value
    end
  end

  #example: User, :login, ['',nil,'admin']
  def assert_invalid_value(klas, attribute, values)
    [*values].each do |value|
      record = valid klas
      record.send(attribute.to_s+'=',value)
      assert_block "<#{klas}.#{attribute}> expected to be invalid when set to <#{value}>" do
        record.valid? # Must be called to generate the errors
        record.errors.invalid? attribute
      end
    end
  end
end

class ValidAttributesHelper
  cattr_accessor :stored_valid_attributes

  def self.valid_attributes(record_name)
    name = record_name.to_s.underscore
    self.stored_valid_attributes ||= YAML::load_file(path_to_valid_yml)
    begin
      attrs = stored_valid_attributes[name].to_options!
    rescue
      raise "attributes for #{name} not found! --> #{path_to_valid_yml}"
    end
    attrs
  end

  def self.path_to_valid_yml
    %w[test spec].each do |folder|
      file = File.join(RAILS_ROOT,folder,'valid_attributes.yml')
      return file if File.exist?(file)
    end
    raise "create valid_attributes.yml in test/ or spec/"
  end
end