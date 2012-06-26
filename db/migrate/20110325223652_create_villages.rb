# -*- encoding : utf-8 -*-
class CreateVillages < ActiveRecord::Migration
  def self.up
    create_table :villages do |t|
      t.string :nom
      t.integer :commune_id
      t.timestamps
    end
  end

  def self.down
    drop_table :villages
  end
end
