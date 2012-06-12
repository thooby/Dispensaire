class CreateTraitements < ActiveRecord::Migration
  def self.up
    create_table :traitements do |t|
      t.integer :groupe_traitement_id
      t.string :acronime
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :traitements
  end
end
