class Car < ActiveRecord::Base
  N_('activerecord.errors.models.car.attributes.model.blank') #to mark that we need this translation
  validates_presence_of :model
  validates_numericality_of :wheels_count, :only_integer=>true, :greater_than=>3,:less_than=>9
end