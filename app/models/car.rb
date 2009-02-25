class Car < ActiveRecord::Base
  validates_presence_of :model
  validates_numericality_of :wheels_count, :only_integer=>true, :greater_than=>3,:less_than=>9
end