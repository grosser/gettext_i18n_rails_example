class Car < ActiveRecord::Base
  validates_presence_of :model
end