# -*- encoding : utf-8 -*-
class AddConsulItemsToConsultations < ActiveRecord::Migration
  def self.up
    add_column :consultations, :motif, :string
    add_column :consultations, :tension_arteriale_haute, :integer
    add_column :consultations, :tension_arteriale_basse, :integer
    add_column :consultations, :poul, :integer
    add_column :consultations, :temperature, :decimal
    add_column :consultations, :respiration, :integer
    add_column :consultations, :poid, :integer
    add_column :consultations, :analyse, :string
  end

  def self.down
    remove_column :consultations, :analyse
    remove_column :consultations, :poid
    remove_column :consultations, :respiration
    remove_column :consultations, :temperature
    remove_column :consultations, :poul
    remove_column :consultations, :tension_arteriale_basse
    remove_column :consultations, :tension_arteriale_haute
    remove_column :consultations, :motif
  end
end
