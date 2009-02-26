PROBLEM
=======
 - fixtures are not maintainable
 - validation change, tests/code breaks
 - forms need to be filled with valid attributes


SOLUTION
========
 - simple and robust validation testing `User.email expected to be invalid when set to <xx@yy>`
 - create a valid record without fixtures
 - create edge-case records without fixtures
 - use valid attributes to test a post or fill a form


INSTALL
=======
`script/plugin install git://github.com/grosser/valid_attributes.git`

Fill the `test/valid_attributes.yml` with 1 valid set of attributes per model  
(can be `attr_protected` or not-`attr_accessible`)  
Example:

    user:
      name: Hans
      login: hand
      address_id: 1

When using Rspec: add to `spec/spec_helper.rb`:

    Spec::Runner.configure do |config|
      ...
      config.include(ValidAttributes)
      ...
    end

When using `Test::Unit`: add to `test/test_helper.rb`

    include ValidAttributes

USAGE
=====
 - `assert_invalid_attributes(User, :email=>[nil,'s','@','asd@sdf'], :name=>[nil,'x','admin'])`
 - set of valid attributes: `valid_attributes User`
 - a valid Record(new): `valid User`
 - a valid Record(saved): `create_valid User`
 - an edge-case User: `valid User, :name=>'oh noo it is too long'`

 
AUTHOR
======
Michael Grosser  
grosser.michael@gmail.com  
Hereby placed under public domain, do what you want, just do not hold me accountable...  
[Original `assert_invalid`](http://www.railsforum.com/viewtopic.php?id=741)
