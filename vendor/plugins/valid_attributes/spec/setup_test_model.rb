require 'active_record'

# connect
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => ":memory:"
)

# table
ActiveRecord::Schema.define(:version => 1) do
  create_table :users do |t|
    t.string :name
    t.integer :age
    t.boolean :ugly
    t.timestamps
  end
end

# model
class User < ActiveRecord::Base
  validates_presence_of :name
  attr_accessible :name, :age
end