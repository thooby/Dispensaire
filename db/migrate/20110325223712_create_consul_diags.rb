# -*- encoding : utf-8 -*-
class CreateConsulDiags < ActiveRecord::Migration
  def self.up
    create_table :consul_diags do |t|
      t.integer :consultation_id
      t.integer :diagnostic_id
      t.timestamps
    end
  end

  def self.down
    drop_table :consul_diags
  end
end
