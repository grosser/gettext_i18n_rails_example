Simple validation testing.
    assert_invalid_attributes(User, :email => [nil, 's', '@', 'asd@sdf'], :name => [nil, 'x', 'admin'])
    User.email expected to be invalid when set to <asd@sdf>`

Additionally: ([Factory Girl](http://github.com/thoughtbot/factory_girl) can do some of these things better...):

 - guard non-model tests from validation changes
 - valid attributes to test a controller :post or fill a form (integration tests / cucumber)
 - create a valid record
 - create edge-case records
 - fixture replacement

INSTALL
=======
    script/plugin install git://github.com/grosser/valid_attributes.git

Fill `test/valid_attributes.yml` or `spec/valid_attributes.yml` with 1 valid set of attributes per model

    user:
      name: Hans
      login: hand
      address_id: 1

### Test::Unit

    # test/test_helper.rb
    include ValidAttributes

### RSpec
    # spec/spec_helper.rb
    Spec::Runner.configure do |config|
      ...
      config.include(ValidAttributes)
      ...
    end

USAGE
=====
    def test_validations
      assert true, valid(User).valid?
      assert_invalid_attributes(User, :email => [nil, 's', '@', 'asd@sdf'], :name => [nil, 'x', 'admin'])`
    end

 - set of valid attributes: `valid_attributes User`
 - a valid Record(new): `valid User`
 - a valid Record(saved): `create_valid User`
 - custom attributes: `valid User, :name=>'oh noo it is too long'`

AUTHOR
======
Michael Grosser  
grosser.michael@gmail.com  
Hereby placed under public domain, do what you want, just do not hold me accountable...  
Derived from [`assert_invalid`](http://www.railsforum.com/viewtopic.php?id=741)
