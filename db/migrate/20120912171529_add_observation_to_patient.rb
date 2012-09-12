class AddObservationToPatient < ActiveRecord::Migration
  def self.up
    add_column :patients, :observation, :string
  end

  def self.down
    remove_column :patients, :observation
  end
end
