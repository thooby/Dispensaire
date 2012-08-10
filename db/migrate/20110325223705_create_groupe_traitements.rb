# -*- encoding : utf-8 -*-
class CreateGroupeTraitements < ActiveRecord::Migration
  def self.up
    create_table :groupe_traitements do |t|
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :groupe_traitements
  end
end
