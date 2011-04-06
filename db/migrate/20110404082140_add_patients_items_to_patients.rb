class AddPatientsItemsToPatients < ActiveRecord::Migration
  def self.up
    add_column :patients, :mois, :integer
    add_column :patients, :jour, :integer
  end

  def self.down
    remove_column :patients, :jour
    remove_column :patients, :mois
  end
end
