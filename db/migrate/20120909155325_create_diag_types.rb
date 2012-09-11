class CreateDiagTypes < ActiveRecord::Migration
  def self.up
    create_table :diag_types do |t|
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :diag_types
  end
end
