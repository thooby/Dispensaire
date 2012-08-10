# -*- encoding : utf-8 -*-
class CreateEthnies < ActiveRecord::Migration
  def self.up
    create_table :ethnies do |t|
      t.string :nom
      t.timestamps
    end
  end

  def self.down
    drop_table :ethnies
  end
end
