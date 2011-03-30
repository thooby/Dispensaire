class CreateConsulTrats < ActiveRecord::Migration
  def self.up
    create_table :consul_trats do |t|
      t.integer :consultation_id
      t.integer :traitement_id
      t.timestamps
    end
  end

  def self.down
    drop_table :consul_trats
  end
end
