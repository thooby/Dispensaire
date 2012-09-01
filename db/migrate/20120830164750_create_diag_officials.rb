class CreateDiagOfficials < ActiveRecord::Migration
  def self.up
    create_table :diag_officials do |t|
      t.string :official_desc

      t.timestamps
    end
  end

  def self.down
    drop_table :diag_officials
  end
end
