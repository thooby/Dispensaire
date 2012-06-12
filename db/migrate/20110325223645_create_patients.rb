class CreatePatients < ActiveRecord::Migration
  def self.up
    create_table :patients do |t|
      t.string :prenom
      t.string :nom
      t.string :carte_code
      t.date :fecha
      t.integer :sex_id
      t.integer :naissance
      t.integer :village_id
      t.integer :commune_id
      t.integer :ethnie_id
      t.integer :profession_id
      t.timestamps
    end
  end

  def self.down
    drop_table :patients
  end
end
