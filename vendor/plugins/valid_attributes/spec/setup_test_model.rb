require 'rubygems'
require 'active_record'

#create model table
ActiveRecord::Schema.define(:version => 1) do
  create_table "users" do |t|
    t.string    "name"
    t.integer   "age"
    t.boolean   "ugly"
    t.timestamps
  end
end

#create model
class User < ActiveRecord::Base
  validates_presence_of :name
  attr_accessible :name, :age
end