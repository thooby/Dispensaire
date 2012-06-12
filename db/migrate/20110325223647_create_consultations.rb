class CreateConsultations < ActiveRecord::Migration
  def self.up
    create_table :consultations do |t|
      t.date :fecha
      t.integer :patient_id
      t.integer :tipeconsultation_id
      t.string :observation
      t.timestamps
    end
  end

  def self.down
    drop_table :consultations
  end
end
