# -*- encoding : utf-8 -*-
class CreateSexes < ActiveRecord::Migration
  def self.up
    create_table :sexes do |t|
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :sexes
  end
end
