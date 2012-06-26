# -*- encoding : utf-8 -*-
class CreateCommunes < ActiveRecord::Migration
  def self.up
    create_table :communes do |t|
      t.string :nom
      t.timestamps
    end
  end

  def self.down
    drop_table :communes
  end
end
