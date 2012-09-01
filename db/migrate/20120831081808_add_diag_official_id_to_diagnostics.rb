class AddDiagOfficialIdToDiagnostics < ActiveRecord::Migration
  def self.up
    add_column :diagnostics, :diag_official_id, :integer
  end

  def self.down
    remove_column :diagnostics, :diag_official_id
  end
end
