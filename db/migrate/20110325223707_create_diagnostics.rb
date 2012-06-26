# -*- encoding : utf-8 -*-
class CreateDiagnostics < ActiveRecord::Migration
  def self.up
    create_table :diagnostics do |t|
      t.string :acronime
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :diagnostics
  end
end
