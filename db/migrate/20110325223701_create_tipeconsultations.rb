class CreateTipeconsultations < ActiveRecord::Migration
  def self.up
    create_table :tipeconsultations do |t|
      t.string :tipe
      t.timestamps
    end
  end

  def self.down
    drop_table :tipeconsultations
  end
end
