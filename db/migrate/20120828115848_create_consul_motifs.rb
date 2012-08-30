# -*- encoding : utf-8 -*-
class CreateConsulMotifs < ActiveRecord::Migration
  def self.up
    create_table :consul_motifs do |t|
      t.integer :consultation_id
      t.integer :motif_id
      t.timestamps
    end
  end

  def self.down
    drop_table :consul_motifs
  end
end
