class CreateCars < ActiveRecord::Migration
  def self.up
    create_table :cars do |t|
      t.string :model
      t.string :country, :manual_language, :limit=>2
      t.integer :wheels_count
      t.timestamps
    end
  end

  def self.down
    drop_table :cars
  end
end
